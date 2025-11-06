#!/bin/bash

# Make this part another script or a keybind in hyprland.conf
# $(ls themes | sed -e 's:\.[^./]*$::' | wofi --show dmenu)

THEME_FILE="$HOME/Theme.txt"

if [ -f $THEME_FILE ]; then
  IFS=":" read -r THEME COLOR < $THEME_FILE
fi

file="$HOME/themes/$THEME.txt"

first_line=$(head -n 1 $file)

if [[ $first_line == "type:dynamic-time" ]]; then
  tail -n +2 $file > "$HOME/.config/dyn-wall-rs/config.toml"
  hyprctl dispatch exec "dyn-wall-rs -b \"$HOME/theme-scripts/backend.sh $COLOR\""
else
  if [[ $first_line == "type:dynamic-color" ]]; then
    dark=$(sed '2q;d' $file)
    light=$(sed '3q;d' $file)

    if [[ $COLOR = "dark" ]]; then
      selected=${dark#dark=}
    else
      selected=${light#light=}
    fi
  else
    selected=$first_line
  fi

  $HOME/theme-scripts/backend.sh $COLOR $selected
fi