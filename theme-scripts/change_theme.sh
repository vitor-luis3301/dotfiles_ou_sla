#!/bin/bash

FILE="$HOME/Theme.txt"

# Check if both arguments exist
if [ -z "$2" ]; then
  if [ -z "$1" ]; then
    echo "Usage: $0 <color> ('light' or 'dark')"
    echo "or"
    echo "Usage: $0 <theme name> <color> ('light' or 'dark')"
    echo "or"
    echo "Usage: $0 <theme name>"
    exit 1
  else
    case "$1" in
      light|dark)
        sed -i "s/:.*/:$1/" $FILE
        ;;
      *)
        if [ -f "$HOME/themes/$1.txt" ]; then
          sed -i "s/^[^:]*/$1/" "$FILE"
        fi
        ;;
    esac
  fi
else
  NEW_THEME=$1
  NEW_COLOR=$2

  echo "${NEW_THEME}:${NEW_COLOR}" > $FILE

  ~/theme-scripts/theme.sh
fi