#!/bin/bash
cp ./wallpapers ~/Pictures/

rm -rf ~/.config/fastfetch ~/.config/hypr ~/.config/waybar ~/.config/swaync ~/.config/rofi ~/.config/wlogout

cp -r ./confs/* ~/.config

cp wofi_change_theme.sh ~