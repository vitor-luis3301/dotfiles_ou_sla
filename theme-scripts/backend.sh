#!/bin/bash

hellwal -i $2 --$1

hyprctl reload
hyprctl hyprpaper reload ,$2

killall waybar
hyprctl dispatch exec waybar