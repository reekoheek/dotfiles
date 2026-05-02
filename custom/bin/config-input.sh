#!/bin/bash

setxkbmap -option caps:escape
xinput set-prop 7 "libinput Natural Scrolling Enabled" 1
notify-send Input 'Keyboard and mouse configured'
