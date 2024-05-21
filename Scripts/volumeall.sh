#!/bin/bash 
iconmic=""
iconvol=""

volboth() {
vol="$(amixer get Master | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"

volmic="$(amixer get Capture | tail -n1 | sed -r 's/.*\[(.*)%\].*/\1/')"
echo "${iconvol}  ${vol}%" "${iconmic} ${volmic}%" 
}

volboth
