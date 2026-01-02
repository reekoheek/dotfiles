#!/bin/sh

SWAYIDLE_PIDFILE="${XDG_RUNTIME_DIR:-/tmp}/swayidle.pid"

is_wayland() {
	[ -n "$WAYLAND_DISPLAY" ] || [ "$XDG_SESSION_TYPE" = "wayland" ]
}

yambar_listen() {
	echo "status|string|$(status)"
	echo

	dbus-monitor "type='signal',interface='reekoheek.Caffeine'" | while read -r line; do
		if expr "$line" : ".*member=StatusChanged" >/dev/null; then
			echo "status|string|$(status)"
			echo
		fi
	done
}

toggle() {
	if [ "$(status)" = "on" ]; then
		set_off
		return
	fi

	set_on
}

start_swayidle() {
	swayidle -w \
		timeout 180 'swaylock -f' \
		timeout 180 'brightnessctl set 0%' \
		timeout 300 '~/.config/swaylock/scripts/suspend.sh' \
		resume 'brightnessctl set 5%' \
		before-sleep 'swaylock -f' >/dev/null 2>&1 &
}

set_on() {
	if is_wayland; then
		pkill swayidle 2>/dev/null
		touch "$SWAYIDLE_PIDFILE"
	else
		xset s 0
		xset dpms 0 0 0
	fi
	dbus-send --session --type=signal /reekoheek/Caffeine reekoheek.Caffeine.StatusChanged
}

set_off() {
	if is_wayland; then
		pkill swayidle 2>/dev/null
		start_swayidle
		rm -f "$SWAYIDLE_PIDFILE"
	else
		xset s 180
		xset dpms 0 0 180
	fi
	dbus-send --session --type=signal /reekoheek/Caffeine reekoheek.Caffeine.StatusChanged
}

status() {
	if is_wayland; then
		if [ -f "$SWAYIDLE_PIDFILE" ]; then
			echo on
		else
			echo off
		fi
	else
		result=$(xset q | grep "Off:" | awk '{ print $6 }')

		if [ "$result" = "0" ]; then
			echo on
			return
		fi

		echo off
	fi
}

case "$1" in
yambar)
	yambar_listen
	;;
on)
	set_on
	;;
off)
	set_off
	;;
toggle)
	toggle
	;;
status)
	status
	;;
*)
	exit 1
	;;
esac
