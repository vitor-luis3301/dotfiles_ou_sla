#!/bin/bash

THEME_FILE="$HOME/Theme.txt"

if [ -f "$THEME_FILE" ]; then
  IFS=":" read -r THEME COLOR <"$THEME_FILE"
fi

ICON="" # your icon

if [[ $COLOR = "dark" ]]; then
  printf '{"text": "%s", "class": "on"}' $ICON
  if [[ $1 = "change" ]]; then
    ~/theme-scripts/change_theme.sh light
  fi
else
  printf '{"text": "%s", "class": "off"}' $ICON
  if [[ $1 = "change" ]]; then
    ~/theme-scripts/change_theme.sh dark
  fi
fi