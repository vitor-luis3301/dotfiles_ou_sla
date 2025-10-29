#!/bin/bash

sudo pacman -Syu
yay -Syu

mv ./wallpapers ~/Pictures/

mv ./confs/fastfetch ~/.config/
mv ./confs/hypr ~/.config/
mv ./confs/waybar ~/.config/
mv ./confs/swaync ~/.config/
