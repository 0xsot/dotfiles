#!/bin/bash
modes="5 minutes\n10 minutes\n20 minutes\n30 minutes\ninfinity"
choice=$(echo -e "$modes" | fuzzel --dmenu --config /home/0x/.config/fuzzel/idle-time.ini)
if [ ! -z "$choice" ]; then
  pkill swayidle
  echo $choice > $HOME/.local/state/idle-time
  if [ "$choice" != "infinity" ]; then
    $HOME/.config/niri/scripts/swayidle.sh &
    disown
  fi
fi