#!/bin/sh

status() {
	result=$(xset q | awk '/Off:/ { print $6 }')
	if [ "$result" = "0" ]; then
		echo "caffeine: on"
	else
		echo "caffeine: off"
	fi
}

notify() {
	command -v polybar-msg >/dev/null 2>&1 && \
		polybar-msg action "#caffeine.hook.0" >/dev/null 2>&1
}

start_xidlehook() {
	pkill -x xidlehook >/dev/null 2>&1
	xidlehook --not-when-audio --not-when-fullscreen \
		--timer 600 'systemctl suspend' '' >/dev/null 2>&1 &
}

stop_xidlehook() {
	pkill -x xidlehook >/dev/null 2>&1
}

set_on() {
	xset s 0
	xset dpms 0 0 0
	stop_xidlehook
	notify
}

set_off() {
	xset s 180
	xset dpms 0 0 180
	start_xidlehook
	notify
}

toggle() {
	if [ "$(status)" = "caffeine: on" ]; then
		set_off
	else
		set_on
	fi
}

case "$1" in
on)
	set_on
	;;
off)
	set_off
	;;
toggle)
	toggle
	;;
*)
	;;
esac

status
