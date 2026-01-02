#!/bin/bash

# clipboard sync wayland <-> x11 (untuk wine/xwayland apps)

# wayland -> x11
wl-paste --watch xclip -selection clipboard > /dev/null 2>&1 &

# x11 -> wayland
while clipnotify; do
		xclip -selection clipboard -o | wl-copy
done > /dev/null 2>&1 &
