#!/bin/bash

DEVICE="tpacpi::kbd_backlight"
STATE_FILE="/tmp/kbd_backlight_state"

case "$1" in
    save-and-off)
        # Save current state and turn off
        brightnessctl -d "$DEVICE" get > "$STATE_FILE"
        brightnessctl -d "$DEVICE" set 0
        ;;
    restore)
        # Restore previous state
        if [ -f "$STATE_FILE" ]; then
            brightnessctl -d "$DEVICE" set "$(cat "$STATE_FILE")"
        else
            brightnessctl -d "$DEVICE" set 1
        fi
        ;;
    off)
        brightnessctl -d "$DEVICE" set 0
        ;;
    on)
        brightnessctl -d "$DEVICE" set 1
        ;;
    max)
        brightnessctl -d "$DEVICE" set 100%
        ;;
    *)
        echo "Usage: $0 {save-and-off|restore|off|on|max}"
        exit 1
        ;;
esac
