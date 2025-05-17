#!/bin/sh

monitor_critical_bat() {
  while [ true ]; do
    if [ "$(status)" = "on" ]; then
      BAT_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
      BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status)
      if [ "$BAT_LEVEL" -lt 15 ] && [ "$BAT_STATUS" = "Discharging" ]; then
        toggle
        notify-send "Low battery, disable caffeine, have a nice sleep"
      fi
    fi
    sleep 60
  done
}

cleanup() {
  kill $MONITOR_PID
  exit 0
}

yambar_listen() {
  monitor_critical_bat &
  MONITOR_PID=$!

  trap cleanup INT TERM

  echo "status|string|$(status)"
  echo

  dbus-monitor "type='signal',interface='reekoheek.Caffeine'" | while read -r line; do
    if expr "$line" : ".*member=StatusChanged" >/dev/null; then
      echo "status|string|$(status)"
      echo
    fi
  done
}

toggle() {
  if [ "$(status)" = "on" ]; then
    xset s 180
    xset dpms 0 0 180
    dbus-send --session --type=signal /reekoheek/Caffeine reekoheek.Caffeine.StatusChanged
    return
  fi

  xset s 0
  xset dpms 0 0 0
  dbus-send --session --type=signal /reekoheek/Caffeine reekoheek.Caffeine.StatusChanged
}

status() {
  result=$(xset q | grep "Off:" | awk '{ print $6 }')

  if [ "$result" = "0" ]; then
    echo on
    return
  fi

  echo off
}

case "$1" in
yambar)
  yambar_listen
  ;;
toggle)
  toggle
  ;;
status)
  status
  ;;
*)
  exit 1
  ;;
esac
