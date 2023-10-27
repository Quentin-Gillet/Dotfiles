SOUND=(
	script="$PLUGIN_DIR/sound.sh"
)

sketchybar --add item sound right
sketchybar --set sound "${SOUND[@]}"
sketchybar --subscribe sound volume_change

