#!/bin/bash
# Clipboard history using fuzzel + cliphist

if command -v cliphist &>/dev/null; then
    cliphist list | fuzzel -d -p "clipboard: " | cliphist decode | wl-copy
else
    notify-send "Clipboard" "cliphist not installed"
fi
