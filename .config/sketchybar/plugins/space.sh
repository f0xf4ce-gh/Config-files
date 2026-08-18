#!/usr/bin/env sh

if [ "$SELECTED" = "true" ]; then
  sketchybar --set "$NAME" background.color=0xffc1c1c1 icon.color=0xff000000
else
  sketchybar --set "$NAME" background.color=0x00000000 icon.color=0xffc1c1c1
fi
