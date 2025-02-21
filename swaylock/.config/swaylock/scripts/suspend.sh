#!/bin/sh

AC_STATUS=$(cat /sys/class/power_supply/AC0/online)
if [ "$AC_STATUS" -eq 0 ]; then
	systemctl suspend
fi

