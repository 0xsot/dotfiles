#!/bin/bash
# Confirmation dialog for power off using fuzzel

if echo -e "No\nYes" | fuzzel --dmenu --prompt "Power off system? " | grep -q "Yes"; then
    systemctl poweroff
fi