#!/bin/bash

if [ -n $1] && [ -n $2 ]; then 
  export THEME=$1 # ex.: frieren
  export COLOR=$2  # "dark" or "light"
fi

wal -n -i "~/Pictures/wallpapers/$THEME/$COLOR.jpg"
hyprctl hyprpaper reload ,"~/Pictures/wallpapers/$THEME/$COLOR.jpg"
killall waybar
hyprctl dispatch exec waybar