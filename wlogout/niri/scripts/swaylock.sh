#!/bin/bash
# Lock screen script

niri msg action do-screen-transition --delay-ms 300
swaylock \
  --clock \
  --screenshots \
  --daemonize \
  --ignore-empty-password \
  --font "Iosevka Nerd Font" \
  --indicator \
  --indicator-radius 150 \
  --effect-scale 0.4 \
  --effect-vignette 0.2:0.5 \
  --effect-blur 4x2 \
  --datestr "%A, %b %d" \
  --timestr "%k:%M" \
  --key-hl-color 7aa89ff2 \
  --ring-color 7aa89ff2 \
  --text-color dcd7bae6 \
  --inside-clear-color 1f1f28f2 \
  --ring-clear-color 7aa89ff2 \
  --text-clear-color dcd7bae6 \
  --inside-ver-color 1f1f28f2 \
  --ring-ver-color 9cabcaf2 \
  --text-ver-color dcd7bae6 \
  --bs-hl-color 54546df2 \
  --inside-wrong-color c34043f2 \
  --ring-wrong-color c34043f2 \
  --text-wrong-color dcd7bae6
