#!/bin/bash
# Confirmation dialog for reboot using fuzzel

if echo -e "No\nYes" | fuzzel --dmenu --prompt "Reboot system? " | grep -q "Yes"; then
    systemctl reboot
fi