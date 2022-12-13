#!/bin/bash

DMENU='dmenu -i -l 20 -p "List $@"'
ROFI='rofi -dmenu -i -p "Keybind $@"'
awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' ~/.config/sxhkd/sxhkdrc |
    column -t -s $'\t' | $ROFI

    # dmenu -i -l 20 -p "List$@"
