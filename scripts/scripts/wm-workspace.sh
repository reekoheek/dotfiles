#!/bin/bash

go_prev() {
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        wtype -M ctrl -M alt -P left
    else
        xdotool key ctrl+alt+Left
    fi
}

go_next() {
    if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
        wtype -M ctrl -M alt -P right
    else
        xdotool key ctrl+alt+Right
    fi
}

case "$1" in
    prev)
        go_prev
        ;;
    next)
        go_next
        ;;
    *)
        echo "Usage: $0 {prev|next}"
        exit 1
        ;;
esac
