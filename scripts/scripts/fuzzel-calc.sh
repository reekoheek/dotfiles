#!/bin/bash
# Calculator using fuzzel

while true; do
    expr=$(echo "" | fuzzel -d -p "calc: ")
    [ -z "$expr" ] && break
    result=$(echo "$expr" | bc -l 2>/dev/null)
    if [ -n "$result" ]; then
        echo "$result" | wl-copy
        notify-send "Calculator" "$expr = $result (copied)"
    else
        notify-send "Calculator" "Invalid expression"
    fi
done
