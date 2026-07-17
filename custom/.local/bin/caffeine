#!/bin/sh

is_on() {
	! pgrep -x xidlehook >/dev/null 2>&1
}

status() {
	if is_on; then
		echo "caffeine: on"
	else
		echo "caffeine: off"
	fi
}

notify() {
	command -v polybar-msg >/dev/null 2>&1 && \
		polybar-msg action "#caffeine.hook.0" >/dev/null 2>&1
}

reset() {
	xset s 0
	xset dpms 0 0 0
	pkill -x xidlehook >/dev/null 2>&1
}

set_on() {
	reset
	notify
}

set_off() {
	reset
	xidlehook --not-when-audio --not-when-fullscreen \
		--timer 300 'xset dpms force off' '' \
		--timer 600 'systemctl suspend' '' >/dev/null 2>&1 &
	notify
}

toggle() {
	if is_on; then
		set_off
	else
		set_on
	fi
}

case "$1" in
on) set_on ;;
off) set_off ;;
toggle) toggle ;;
esac

status
