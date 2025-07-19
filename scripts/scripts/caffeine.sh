#!/bin/sh

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

set_on() {
	xset s 0
	xset dpms 0 0 0
	dbus-send --session --type=signal /reekoheek/Caffeine reekoheek.Caffeine.StatusChanged
}

set_off() {
	xset s 180
	xset dpms 0 0 180
	dbus-send --session --type=signal /reekoheek/Caffeine reekoheek.Caffeine.StatusChanged
}

status() {
	result=$(xset q | grep "Off:" | awk '{ print $6 }')

	if [ "$result" = "0" ]; then
		echo on
		return
	fi

	echo off
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
