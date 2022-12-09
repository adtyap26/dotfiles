#!/bin/bash

# Ask the user to select a variable using dmenu or rofi
selected=$(echo -e "1080\n720\n480\n360\n240" | dmenu -p "Please Select Quality: ")

# Set the selected variable
if [ "$selected" == "1080" ]; then
  variable="1080" && notify-send '1080p Youtube Quality' --icon=dialog-information
elif [ "$selected" == "720" ]; then
  variable="720" && notify-send '720p Youtube Quality' --icon=dialog-information
elif [ "$selected" == "480" ]; then
  variable="480" && notify-send '480p Youtube Quality' --icon=dialog-information
elif [ "$selected" == "360" ]; then
  variable="360" && notify-send '360p Youtube Quality' --icon=dialog-information
elif [ "$selected" == "240" ]; then
  variable="240" && notify-send '240p Youtube Quality' --icon=dialog-information
fi

# Replace the value of the local variable "changedQuality" with the selected variable
sed -i "s/\(changedQuality = \)[0-9]\+/\1$variable/g" ~/.config/mpv/scripts/ytdlautoformat.lua

