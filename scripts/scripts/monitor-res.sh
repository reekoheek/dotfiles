#!/bin/sh

SCRIPT_DIR=$(dirname "$0")

UPDATE_RES="$SCRIPT_DIR/update-res.sh"

# notify-send "Monitor resolution" "Started"
sleep 2

LAST_RESOLUTION=""
while [ true ]; do
	CURRENT_RESOLUTION=$(xrandr | grep '*' | awk '{print $1}')

	if [ "$CURRENT_RESOLUTION" != "$LAST_RESOLUTION" ]; then
		notify-send "Monitor resolution" "Resolution changed: $LAST_RESOLUTION → $CURRENT_RESOLUTION"
		$UPDATE_RES
		LAST_RESOLUTION="$CURRENT_RESOLUTION"
	fi

	sleep 2
done
