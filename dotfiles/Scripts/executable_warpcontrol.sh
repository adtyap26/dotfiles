#!/bin/bash
# Display options for controlling warp-cli in rofi
# option=$(echo -e "connect\ndisconnect" | rofi -dmenu -p " Warp control" -theme-str 'window {width: 20%;height: 20%;}')
option=$(echo -e " Connect\n Disconnect" | dmenu -p " Warp control")

# option=`zenity --list --text=" Warp Cloudflare 1.1.1.1" --column="Select your choice:" " Connect" " Disconnect"` # Using zenity

# Connect or disconnect from warp-cli based on the selected option
if [[ "$option" == " Connect" ]]; then
	warp-cli connect
	# notify-send -i /usr/share/icons/Sardi/scalable/status/network-vpn.svg "Connected to warp!"
	notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/status/symbolic/network-vpn-symbolic.svg "Connected to warp!"
elif [[ "$option" == " Disconnect" ]]; then
	warp-cli disconnect
	# notify-send -i /usr/share/icons/Sardi/scalable/status/network-offline-symbolic.svg "Disconnected to warp!"
	notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/status/symbolic/network-offline-symbolic.svg "Disconnected to warp!"
else
	exit 0
fi
