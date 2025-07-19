#!/bin/sh

feh --bg-center ~/Pictures/semar3.png > /dev/null 2>&1 &

killall yambar
yambar > /dev/null 2>&1 &
