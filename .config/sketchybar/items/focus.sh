#!/usr/bin/env sh


FOCUS=(
  label.font="$BAR_ICON_FONT:Regular:13.0"
  script="$HOME/.config/sketchybar/plugins/focus_icon.sh"
  label.drawing=on
  background.padding_left=10
  associated_display=active
  background.drawing=on
)

# E V E N T S
sketchybar -m --add event window_focus \
              --add event title_change

sketchybar --add item focus left
sketchybar --set focus "${FOCUS[@]}"
sketchybar --subscribe focus front_app_switched window_focus space_change

# W I N D O W  T I T L E 
sketchybar -m --add item title left \
              --set title script="$HOME/.config/sketchybar/plugins/window_title.sh" \
              --subscribe title window_focus front_app_switched space_change title_change
