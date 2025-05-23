#!/bin/sh

# Control variable
# Possible values: NONE, FULL, LOW, CRITICAL
last="NONE"

# Default values for LOW/CRITICAL status
low=35
critical=20

while true; do

  # If battery is plugged, do stuff
  battery="/sys/class/power_supply/BAT0"
  if [ -d $battery ]; then

    capacity=$(cat $battery/capacity)
    status=$(cat $battery/status)

    # If battery full and not already warned about that
    if [ "$last" != "FULL" ] && [ "$status" = "Full" ]; then
      notify-send "Battery Charged" "Battery is 80% charged." -i "battery-charging-custom" -r 9991
      last="FULL"
    fi

    # If low and discharging
    if [ "$last" != "LOW" ] && [ "$status" = "Discharging" ] && \
       [ $capacity -le $low ]; then
      notify-send "Low Battery" "${capacity}% of battery remaining." -u critical -i "battery-alert-custom" -r 9991
      last=LOW
    fi

    # If critical and discharging
    if [ "$status" = "Discharging" ] && [ $capacity -le $critical ]; then
      notify-send "Low Battery" "${capacity}% of battery remaining." -u critical -i "battery-alert-custom" -r 9991
      last=CRITICAL
    fi
  fi
  sleep 60
done
