#!/bin/sh

pkill yambar
if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
	swaybg -m center -i ~/Pictures/semar3.png > /dev/null 2>&1 &
	yambar --config ~/.config/yambar/config-wayland.yml > /dev/null 2>&1 &
else
	feh --bg-center ~/Pictures/semar3.png > /dev/null 2>&1 &
	yambar --config ~/.config/yambar/config.yml > /dev/null 2>&1 &
fi


