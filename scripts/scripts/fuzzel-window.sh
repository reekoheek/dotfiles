#!/bin/bash
# Window switcher using fuzzel

selected=$(wlrctl window list | sed 's/: / | /g' | fuzzel -d -p "window: ")

if [ -n "$selected" ]; then
    title=$(echo "$selected" | sed 's/^[^|]*| //' | sed 's/ | /: /g')
    wlrctl window focus "title:$title"
fi
