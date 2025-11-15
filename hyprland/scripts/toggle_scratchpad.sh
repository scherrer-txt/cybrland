#!/usr/bin/env bash

CLASS="$1"
CMD="$2"
WORKSPACE="$3"

# Fallback: workspace musí být explicitně zadán
if [ -z "$WORKSPACE" ]; then
    echo "Error: workspace argument missing"
    exit 1
fi

# Get active monitor
ACTIVE_MONITOR=$(hyprctl monitors -j | jq -r '.[] | select(.focused == true) | .id')

# if window exists but is on a different scratchpad, kill it (stale instance)
if [ -n "$IS_OPEN" ]; then
    CURRENT_WS=$(hyprctl clients -j | jq -r ".[] | select(.class == \"$CLASS\") | .workspace.name")

    if [ "$CURRENT_WS" != "special:$WORKSPACE" ]; then
        hyprctl dispatch closewindow "$IS_OPEN"
        IS_OPEN=""
    fi
fi

# Ensure workspace exists and is on active monitor
hyprctl dispatch moveworkspacetomonitor "special:$WORKSPACE $ACTIVE_MONITOR"

if [ -n "$IS_OPEN" ]; then
    # The app exists → toggle special workspace
    hyprctl dispatch togglespecialworkspace "$WORKSPACE"
else
    # The app doesn't exist → start it
    eval "$CMD" &
    sleep 0.4
    # Toggle after creating window
    hyprctl dispatch togglespecialworkspace "$WORKSPACE"
fi
