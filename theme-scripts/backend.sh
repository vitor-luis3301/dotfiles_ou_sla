#!/bin/bash

hellwal -i $1

hyprctl reload
hyprctl hyprpaper reload ,$1

killall waybar
hyprctl dispatch exec waybar