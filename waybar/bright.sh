#!/usr/bin/env bash
LOG=/tmp/bright.log
STATE_FILE=/tmp/bright_state

declare -A SCALE=( [1]=100 [2]=26 )
DISPLAYS=(1 2)
STEP=25
VCP_CODE=16
DBUS_DEST="com.ddcutil.DdcutilService"
DBUS_OBJ="/com/ddcutil/DdcutilObject"
DBUS_IFACE="com.ddcutil.DdcutilInterface"

LOCK_FILE="/tmp/bright.lock"
exec 200>"$LOCK_FILE"
flock -w 2 200 || { echo "[$(date '+%H:%M:%S')] Busy, skipping scroll" >> "$LOG"; exit 0; }

get_state() {
    local disp="$1"
    [[ -f "$STATE_FILE" ]] && grep "^$disp=" "$STATE_FILE" 2>/dev/null | cut -d= -f2 || echo ""
}

save_state() {
    local disp="$1" val="$2"
    local temp
    temp=$(mktemp)
    [[ -f "$STATE_FILE" ]] && grep -v "^$disp=" "$STATE_FILE" >"$temp" 2>/dev/null || true
    echo "$disp=$val" >>"$temp"
    mv "$temp" "$STATE_FILE"
}

get_max_brightness() {
    local disp="$1"
    local output max
    output=$(gdbus call --session \
        --dest "$DBUS_DEST" \
        --object-path "$DBUS_OBJ" \
        --method "$DBUS_IFACE.GetVcp" "$disp" "" "$VCP_CODE" 0 2>/dev/null) || true

    max=$(echo "$output" | grep -Eo 'uint16 [0-9]+' | tail -n1 | grep -Eo '[0-9]+') || true
    [[ -n "$max" && "$max" -gt 0 ]] && echo "$max" || echo 100
}

get_current_scaled() {
    local disp="$1"
    local cached output cur max scale scaled

    cached=$(get_state "$disp")
    if [[ -n "$cached" && "$cached" =~ ^[0-9]+$ ]]; then
        echo "[$(date '+%H:%M:%S')] Display $disp: using cached value $cached%" >>"$LOG"
        echo "$cached"
        return
    fi

    output=$(gdbus call --session \
        --dest "$DBUS_DEST" \
        --object-path "$DBUS_OBJ" \
        --method "$DBUS_IFACE.GetVcp" "$disp" "" "$VCP_CODE" 0 2>/dev/null) || true

    cur=$(echo "$output" | grep -Eo 'uint16 [0-9]+' | head -n1 | grep -Eo '[0-9]+' | tr -d '[:space:]') || true
    max=$(echo "$output" | grep -Eo 'uint16 [0-9]+' | tail -n1 | grep -Eo '[0-9]+' | tr -d '[:space:]') || true

    if [[ -z "$cur" || -z "$max" || "$max" -eq 0 ]]; then
        echo "[$(date '+%H:%M:%S')] Display $disp: could not read VCP (cur=$cur, max=$max)" >>"$LOG"
        echo 0
        return
    fi

    scale=${SCALE[$disp]:-100}
    scaled=$(( cur * scale / max ))

    echo "[$(date '+%H:%M:%S')] Display $disp: current raw=$cur max=$max scaled=$scaled" >>"$LOG"
    echo "$scaled"
}


set_value() {
    local disp="$1" val="$2"
    echo "[$(date '+%H:%M:%S')] Setting display $disp to raw value: $val" >>"$LOG"
    gdbus call --session \
        --dest "$DBUS_DEST" \
        --object-path "$DBUS_OBJ" \
        --method "$DBUS_IFACE.SetVcp" "$disp" "" "$VCP_CODE" "$val" 0 >/dev/null 2>&1 || true
}

clamp() {
    local v=$1
    ((v<0)) && v=0
    ((v>100)) && v=100
    echo "$v"
}

ARG="${1:-}"
echo "[$(date '+%H:%M:%S')] ===== Script called with: $ARG =====" >>"$LOG"

if [[ "$ARG" == "up" ]]; then
    DELTA="+$STEP"
elif [[ "$ARG" == "down" ]]; then
    DELTA="-$STEP"
elif [[ "$ARG" =~ ^[+-]?[0-9]+$ ]]; then
    DELTA="$ARG"
else
    echo "Usage: bright.sh up|down|+N|-N|ABS" >&2
    exit 1
fi

for DISP in "${DISPLAYS[@]}"; do
    echo "[$(date '+%H:%M:%S')] Starting loop for display $DISP" >>"$LOG"
    CUR=$(get_current_scaled "$DISP" 2>>"$LOG" || echo 0)
    echo "[$(date '+%H:%M:%S')] Got CUR=$CUR" >>"$LOG"

    if ! [[ "$CUR" =~ ^[0-9]+$ ]]; then
        echo "[$(date '+%H:%M:%S')] Display $DISP: invalid current value, skipping" >>"$LOG"
        continue
    fi

    if [[ "${DELTA:0:1}" == "+" ]]; then
        VAL=$(( CUR + ${DELTA:1} ))
    elif [[ "${DELTA:0:1}" == "-" ]]; then
        VAL=$(( CUR - ${DELTA:1} ))
    else
        VAL=$DELTA
    fi

    VAL=$(clamp "$VAL")
    SCALE_MAX=$(get_max_brightness "$DISP")
    RAW_VAL=$(( (VAL * SCALE_MAX + 50) / 100 ))

    echo "[$(date '+%H:%M:%S')] Display $DISP: $CUR% -> $VAL% (raw=$RAW_VAL, max=$SCALE_MAX)" >>"$LOG"

    save_state "$DISP" "$VAL"
    set_value "$DISP" "$RAW_VAL" &
done

wait
pkill -RTMIN+9 waybar 2>/dev/null || true
exit 0
