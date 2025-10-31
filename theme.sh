#!/bin/bash

THEME=$1 # ex.: frieren
COLOR=$2  # "dark" or "light"

wal -n -i "~/Pictures/wallpapers/$THEME/$COLOR.jpg"
hyprctl hyprpaper reload ,"~/Pictures/wallpapers/$THEME/$COLOR.jpg"
killall waybar
hyprctl dispatch exec waybar