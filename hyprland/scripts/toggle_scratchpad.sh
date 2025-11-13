#!/usr/bin/env bash
CLASS="$1"
CMD="$2"
WORKSPACE="${3:-$CLASS}"

# Get active monitor
ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .id')

# Check if already exists
IS_OPEN=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$CLASS\") | .address" | head -n 1)

if [ -n "$IS_OPEN" ]; then
    # If exists - move workspace to active monitor
    hyprctl dispatch moveworkspacetomonitor "special:$WORKSPACE $ACTIVE_MONITOR"
    hyprctl dispatch togglespecialworkspace "$WORKSPACE"
else
    # If doesnt exist - run app
    eval "$CMD" &
    sleep 0.5
    # Move workspace to active monitor
    hyprctl dispatch moveworkspacetomonitor "special:$WORKSPACE $ACTIVE_MONITOR"
    hyprctl dispatch togglespecialworkspace "$WORKSPACE"
fi