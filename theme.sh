#!/bin/bash

THEME_FILE="$HOME/Theme.txt"

if [ -n "$1" ] && [ -n "$2" ]; then 
  THEME=$1
  COLOR=$2

  echo "$THEME:$COLOR" > $THEME_FILE
else
  if [ -f $THEME_FILE ]; then
    IFS=":" read -r THEME COLOR < $THEME_FILE
fi

IMAGE="$HOME/Pictures/wallpapers/$THEME/$COLOR.jpg"

wal -n -i "$IMAGE"
hyprctl hyprpaper reload , "$IMAGE"
killall waybar
hyprctl dispatch exec waybar

hyprctl reload