#!/bin/bash
# Check for updates on Fedora
updates=$(dnf check-update 2>/dev/null | grep -c "^[a-zA-Z0-9]" || echo "0")
printf '{"text": "%s", "alt": "%s", "tooltip": "%s updates available"}' "$updates" "$updates" "$updates"