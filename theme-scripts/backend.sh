#!/bin/bash

hellwal -i $2 --$1

hyprctl reload
hyprctl hyprpaper reload ,$2

if [ $2 = "dark" ]; then
  gsettings set org.gnome.desktop.interface color-scheme prefer-dark
  gsettings set org.gnome.desktop.interface gtk-theme adwaita-dark
  # gsettings set org.gnome.desktop.interface icon-theme breeze-dark
else
  gsettings set org.gnome.desktop.interface color-scheme default
  gsettings set org.gnome.desktop.interface gtk-theme adwaita
  # gsettings set org.gnome.desktop.interface icon-theme breeze-dark

killall waybar
hyprctl dispatch exec waybar