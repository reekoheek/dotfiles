#!/bin/sh

SCRIPT_DIR=$(dirname "$0")
CAFFEINE="$SCRIPT_DIR/caffeine.sh"

notify-send "Monitor battery" "Started"

while [ true ]; do
	BAT_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
	BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status)
	CAF_STATUS=$($CAFFEINE status)

	if [ "$CAF_STATUS" = "on" ]; then
		if [ "$BAT_LEVEL" -lt 15 ] && [ "$BAT_STATUS" = "Discharging" ]; then
			echo "low battery"
			$CAFFEINE off
			notify-send "Monitor battery" "Low battery, disable caffeine"
		fi
	fi

	if [ "$BAT_LEVEL" -lt 5 ] && [ "$BAT_STATUS" = "Discharging" ]; then
		echo "battery almost drained"
		notify-send "Monitor battery" "Battery almost drained, have a nice sleep"
		sleep 5
		poweroff
	fi

	sleep 60
done
