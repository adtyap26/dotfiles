#!/bin/bash

temp() {
	tempstat="$(sensors | grep -m 1 temp1 | awk '{gsub(/\+/,"")}1''{print $2}')"
	    if [[ $tempstat < 40 ]] ; then
	    tempt=""
	    elif [[ $tempstat > 40 ]] && [[ $tempstat < 49 ]] ; then
	    temp=" "
	    elif [[ $tempstat > 50 ]] && [[ $tempstat < 65 ]] ; then
	    temp=" "
	    elif [[ $tempstar > 70 ]]  ; then
	    temp=" "
	    fi

	    echo "$tempstat $temp"
}

echo "$(temp)"
