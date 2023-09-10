#!/bin/sh

# Control variable
# Possible values: NONE, FULL, LOW, CRITICAL
last="NONE"

# Default values for LOW/CRITICAL status
low=20
critical=15

while true; do

  # If battery is plugged, do stuff
  battery="/sys/class/power_supply/BAT0"
  if [ -d $battery ]; then

    capacity=$(cat $battery/capacity)
    status=$(cat $battery/status)

    # If battery full and not already warned about that
    if [ "$last" != "FULL" ] && [ "$status" = "Full" ]; then
      notify-send -i /usr/share/icons/Sardi/scalable/status/notification-battery-100.svg "Battery full"
      last="FULL"
    fi

    # If low and discharging
    if [ "$last" != "LOW" ] && [ "$status" = "Discharging" ] && \
       [ $capacity -le $low ]; then
      notify-send -i  /usr/share/icons/Arc/status/symbolic/battery-caution-symbolic.svg "Battery low: $capacity%"
      last=LOW
    fi

    # If critical and discharging
    if [ "$status" = "Discharging" ] && [ $capacity -le $critical ]; then
      notify-send -u critical -i /usr/share/icons/Adwaita/scalable/status/battery-level-0-symbolic.svg "Battery very low: $capacity%"
      last=CRITICAL
    fi
  fi
  sleep 60
done
