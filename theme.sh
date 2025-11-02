#!/bin/bash

killall waybar

THEME_FILE="$HOME/Theme.txt"

if [ -n "$1" ] && [ -n "$2" ]; then 
  THEME=$1
  COLOR=$2

  echo "$THEME:$COLOR" > $THEME_FILE
else
  if [ -f $THEME_FILE ]; then
    IFS=":" read -r THEME COLOR < $THEME_FILE
fi
declare -a colors

IMAGE="$HOME/Pictures/wallpapers/$THEME/$COLOR.jpg"

wal -n -i "$IMAGE"

i=0
while IFS= read -r line; do
  colors[i]="${line/'#'}"
  ((i++))
done < "$HOME/.cache/wal/colors"

hyprctl keyword "general:col.active_border rgba('${colors[2]}ee') rgba('${colors[6]}ee') 45deg"
hyprctl hyprpaper reload , "$IMAGE"
hyprctl dispatch exec waybar