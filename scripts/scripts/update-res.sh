#!/bin/sh

is_wayland() {
	[ -n "$WAYLAND_DISPLAY" ] || [ "$XDG_SESSION_TYPE" = "wayland" ]
}

pkill yambar
yambar > /dev/null 2>&1 &
if is_wayland; then
	pkill swaybg
	swaybg -m center -i ~/Pictures/semar3.png > /dev/null 2>&1 &
else
	pkill feh
	feh --bg-center ~/Pictures/semar3.png > /dev/null 2>&1 &
fi


