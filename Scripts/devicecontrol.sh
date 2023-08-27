#!/bin/bash

# # Get the list of devices
# devices=$(xinput --list)
#
# # Display the list of devices to the user
# echo "##################################################################################"
# echo "Choose a device to enable/disable:"
# echo "$devices"
#
# echo "##################################################################################"
# # Get the device ID of the device chosen by the user
# read -p "Enter the ID of the device: " device_id
#
# # Get the current state of the device
# device_state=$(xinput --list-props $device_id | grep "Device Enabled" | awk '{print $4}')
#
# # Enable or disable the device based on its current state
# if [ $device_state -eq 1 ]
# then
#     xinput --disable $device_id
#     echo "Device $device_id disabled."
# else
#     xinput --enable $device_id
#     echo "Device $device_id enabled."
# fi
#




# Read in the list of devices
devlist=$(cat ~/Database/deviceId.txt)

# Use dmenu to ask the user which device they want to control
device=$(echo "$devlist" | dmenu -i -l 20 -p "Choose device: ")

# Extract the id of the chosen device
id=$(echo "$device" | grep -o "[0-9]*$")

# Use dmenu to ask the user whether they want to enable or disable the device
choice=$(echo -e "Enable\nDisable" | dmenu -i -p "What do you want to do with $device?")

# Enable or disable the device using xinput
if [ "$choice" == "Enable" ]; then
  xinput --enable $id
  notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/status/symbolic/touchpad-enabled-symbolic.svg "$device is Enable"
else
  xinput --disable $id
  notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/status/symbolic/touchpad-disabled-symbolic.svg "$device is Disable"
fi











# # # Get the device ID of the selected device
#  device_id=$(echo "$devices" | grep "$selected_device" | grep -o "id=[0-9]*" | grep -o "[0-9]*")
# #
# # # Get the current state of the device
#  device_state=$(xinput --list-props $device_id | grep "Device Enabled" | awk '{print $4}')
# #
# # # Enable or disable the device based on its current state
#  if [ $device_state -eq 1 ]
#  then
#      xinput --disable $device_id
#      echo "Device $device_id disabled."
#  else
#      xinput --enable $device_id
#      echo "Device $device_id enabled."
#  fi
