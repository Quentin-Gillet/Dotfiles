#!/bin/bash

APP_NAME="$(yabai -m query --windows --window | jq -r '.app')"

sketchybar -m --set focus label="$($HOME/.config/sketchybar/plugins/icon_map.sh "$APP_NAME")"
