#!/bin/bash
echo "System Updates"
echo "=============="
echo ""
sleep 0.1

sudo dnf upgrade -y

notify-send "Update complete"
echo ""
echo "[INFO] Update complete"
sleep 2