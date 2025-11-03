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

if [ -f $THEME ]; then
  IMAGE="$HOME/Pictures/wallpapers/$THEME/$THEME-$COLOR.jpg"
  hellwal -i "$IMAGE"
else
  IMAGE="$HOME/Pictures/wallpapers/$THEME.jpg"
  hellwal -i $IMAGE --$COLOR

hyprctl reload
hyprctl hyprpaper reload , "$IMAGE"
hyprctl dispatch exec waybar