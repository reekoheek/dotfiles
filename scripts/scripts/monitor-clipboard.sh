#!/bin/bash

# wayland -> cliphist
wl-paste --watch cliphist store > /dev/null 2>&1 &

# wayland -> x11 + cliphist
# wl-paste --watch sh -c 'tee >(cliphist store) | xclip -selection clipboard' > /dev/null 2>&1 &

# x11 -> wayland
# while clipnotify; do
# 		xclip -selection clipboard -o | wl-copy
# done > /dev/null 2>&1 &
