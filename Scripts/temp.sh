#!/bin/bash

tempfloat="$(sensors | grep -m 1 CPU | awk '{gsub(/\+/,"")}1''{print $2}')"

temp() {
  tempstat=${tempfloat%\.*}
	    if [[ $tempstat -ge 30 ]] && [[ $tempstat -le 39 ]] ; then
	    temp="" && sleep 10
	    elif [[ $tempstat -ge 40 ]] && [[ $tempstat -le 49 ]] ; then
	    temp="" && sleep 10
	    elif [[ $tempstat -ge 50 ]] && [[ $tempstat -le 69 ]] ; then
	    temp="" && sleep 10
	    elif [[ $tempstat -ge 70 ]] ; then
	    temp="" && sleep 10
	    fi

	    printf "$temp ${tempstat}°C"
}
echo "$(temp)"
