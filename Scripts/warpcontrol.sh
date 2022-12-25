#!/bin/bash

# set -euo pipefail
# # Display options for controlling warp-cli in rofi
# # option=$(echo -e " connect\n disconnect" | rofi -dmenu -p " Warp control" -theme-str 'window {width: 20%;height: 20%;}')
# option=$(echo -e " connect\n disconnect" | dmenu -i -p " Warp control")
#
# # Connect or disconnect from warp-cli based on the selected option
# if [[ $option = "connect" ]]; then
#   warp-cli connect 
#   notify-send -i /usr/share/icons/Sardi/scalable/status/network-vpn.svg "Connected to warp!"
# elif [[ $option = "disconnect" ]]; then
#   warp-cli disconnect 
#   notify-send -i /usr/share/icons/Sardi/scalable/status/network-offline-symbolic.svg "Disconnecting warp!"
# else
#   exit 0
# fi



# Display options for controlling warp-cli in rofi
option=$(echo -e "connect\ndisconnect" | rofi -dmenu -p " Warp control" -theme-str 'window {width: 20%;height: 20%;}')
# option=$(echo -e " connect\n disconnect" | dmenu -i -p " Warp control")

# Connect or disconnect from warp-cli based on the selected option
if [[ $option == "connect" ]]; then
  warp-cli connect
  notify-send -i /usr/share/icons/Sardi/scalable/status/network-vpn.svg "Connected to warp!"
elif [[ $option == "disconnect" ]]; then
  warp-cli disconnect
  notify-send -i /usr/share/icons/Sardi/scalable/status/network-offline-symbolic.svg "Disconnected to warp!"
else
  exit 0
fi

