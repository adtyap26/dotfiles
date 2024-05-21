#!/bin/bash

echo "Choose an option:"
echo "1. Extended mode on the left side for external monitor"
echo "2. Extended mode on the right side for external monitor"
echo "3. Mirror mode"
echo "4. Only display on the external monitor"

read -p "Enter your choice (1/2/3/4): " choice

case $choice in
    1)
        xrandr --output eDP-1 --auto --output HDMI-2 --auto --left-of eDP-1
        ;;
    2)
        xrandr --output eDP-1 --auto --output HDMI-2 --auto --right-of eDP-1
        ;;
    3)
        xrandr --output eDP-1 --auto --output HDMI-2 --auto --same-as eDP-1
        ;;
    4)
        xrandr --output eDP-1 --off --output HDMI-2 --auto
        ;;
    *)
        echo "Invalid choice. Please enter a valid option."
        ;;
esac

