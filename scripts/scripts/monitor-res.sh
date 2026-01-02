#!/bin/sh

SCRIPT_DIR=$(dirname "$0")

UPDATE_RES="$SCRIPT_DIR/update-res.sh"

get_resolution() {
	if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
		wlr-randr | grep 'current' | awk '{print $1}'
	else
		xrandr | grep '*' | awk '{print $1}' | head -n 1
	fi
}

LAST_RESOLUTION=""
while [ true ]; do
	CURRENT_RESOLUTION=$(get_resolution)

	if [ "$CURRENT_RESOLUTION" != "$LAST_RESOLUTION" ]; then
		# notify-send "Monitor resolution" "Resolution changed: $LAST_RESOLUTION → $CURRENT_RESOLUTION"
		$UPDATE_RES
		LAST_RESOLUTION="$CURRENT_RESOLUTION"
	fi

	sleep 5
done
