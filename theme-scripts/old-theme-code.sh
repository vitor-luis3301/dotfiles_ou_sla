THEME_FILE="$HOME/Theme.txt"

if [ -n "$1" ] && [ -n "$2" ]; then 
  THEME=$1
  COLOR=$2

  echo "$THEME:$COLOR" > $THEME_FILE
else
  if [ -f $THEME_FILE ]; then
    IFS=":" read -r THEME COLOR < $THEME_FILE
  fi
fi

if [ -f "$HOME/Pictures/wallpapers/$THEME" ]; then
  rm -rf .cache/hellwal/
  if [ $COLOR = "dynamic" ]; then
    hyprctl dispatch exec "dyn-wall-rs -d $HOME/Pictures/wallpapers/$THEME/ -b $HOME/theme-scripts/backend.sh"
  else
    ./backend.sh $HOME/Pictures/wallpapers/$THEME/$COLOR.jpg $COLOR
  fi
else
  ./backend.sh $HOME/Pictures/wallpapers/$THEME.jpg $COLOR
fi