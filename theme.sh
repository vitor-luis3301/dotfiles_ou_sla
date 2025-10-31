#!/bin/bash

THEME=$1 # ex.: frieren
COLOR=$2  # "dark" or "light"

hyprctl hyprpaper reload ,"~/Pictures/wallpapers/$THEME/$COLOR"