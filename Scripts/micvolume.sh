#!/bin/bash 
icon=""
vol="$(amixer get Capture | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
echo "${icon} ${vol}%"
