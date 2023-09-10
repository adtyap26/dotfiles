#!/bin/bash

# Get the list of available services
services=$(systemctl list-unit-files --type=service | awk '{print $1}' | grep -vE '^(UNIT|halt|reboot|ssh)')

# Show the list of available services using dmenu
selected_service=$(echo "$services" | dmenu -i -l 20 -p "Please choose the service: ")

# Ask the user what they want to do with the selected service
action=$(echo -e "enable/start\ndisable/stop" | dmenu -i -p "What do you want to do with $selected_service?")

# Enable or start the selected service
if [ "$action" == "enable/start" ]; then
  systemctl enable --now "$selected_service"
  if [ $? -eq 0 ]; then
    notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/status/symbolic/process-completed-symbolic.svg "$selected_service has been enabled and started"
  else
    notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/status/symbolic/dialog-error-symbolic.svg "Error" "Failed to enable and start $selected_service"
  fi

# Disable or stop the selected service
elif [ "$action" == "disable/stop" ]; then
  systemctl disable --now "$selected_service"
  if [ $? -eq 0 ]; then
    notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/status/symbolic/process-error-symbolic.svg "$selected_service has been disabled and stoped"
  else
    notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/status/symbolic/dialog-error-symbolic.svg "Error" "Failed to disable and stop $selected_service"
  fi
fi

