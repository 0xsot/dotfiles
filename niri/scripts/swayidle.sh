#!/bin/bash

NIRICONF="$HOME/.config/niri"
IDLE_TIME_FILE="$HOME/.local/state/idle-time"

if [ -f "$IDLE_TIME_FILE" ]; then
    IDLE_TIME=$(cat "$IDLE_TIME_FILE")
else
    IDLE_TIME="10 minutes"
    mkdir -p "$HOME/.local/state"
    echo "$IDLE_TIME" > "$IDLE_TIME_FILE"
fi

pkill -x swayidle

if [ "$IDLE_TIME" == "infinity" ]; then
    exit 0
fi

case "$IDLE_TIME" in
    "5 minutes")
        LOCK_TIMEOUT=300
        DPMS_TIMEOUT=420
        SUSPEND_TIMEOUT=600
        ;;
    "10 minutes")
        LOCK_TIMEOUT=600
        DPMS_TIMEOUT=720
        SUSPEND_TIMEOUT=1800
        ;;
    "20 minutes")
        LOCK_TIMEOUT=1200
        DPMS_TIMEOUT=1500
        SUSPEND_TIMEOUT=2400
        ;;
    "30 minutes")
        LOCK_TIMEOUT=1800
        DPMS_TIMEOUT=2100
        SUSPEND_TIMEOUT=3600
        ;;
    *)
        LOCK_TIMEOUT=600
        DPMS_TIMEOUT=720
        SUSPEND_TIMEOUT=1800
        ;;
esac

exec swayidle -w \
    timeout $LOCK_TIMEOUT "$NIRICONF/scripts/kbd-backlight.sh save-and-off && $NIRICONF/scripts/swaylock.sh" \
    resume "$NIRICONF/scripts/kbd-backlight.sh restore" \
    timeout $DPMS_TIMEOUT 'niri msg action power-off-monitors' \
    resume 'niri msg action power-on-monitors' \
    timeout $SUSPEND_TIMEOUT 'systemctl suspend' \
    before-sleep "$NIRICONF/scripts/kbd-backlight.sh save-and-off && $NIRICONF/scripts/swaylock.sh"
