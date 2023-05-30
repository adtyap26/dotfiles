#!/bin/bash

if 
  pgrep -x "screenkey" > /dev/null; then
  pkill -x screenkey 
  notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/actions/22/fcitx-vk-inactive.svg 'Screenkey Off!'
else
  screenkey &
  notify-send -i ~/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/actions/22/fcitx-vk-active.svg 'Screenkey On!'
fi
