#!/bin/bash

# Ask the user to select a variable using dmenu or rofi
selected=$(echo -e "1080\n720\n480" | dmenu -p "Please Select Quality: ")

# Set the selected variable
if [ "$selected" == "1080" ]; then
  variable="1080"
elif [ "$selected" == "720" ]; then
  variable="720"
elif [ "$selected" == "480" ]; then
  variable="480"
fi

# Replace the value of the local variable "changedQuality" with the selected variable
# in the file "file.txt" and save the changes to the same file
sed -i "s/\(changedQuality = \)[0-9]\+/\1$variable/g" ~/.config/mpv/scripts/ytdlautoformat.lua

