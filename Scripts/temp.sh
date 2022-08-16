#!/bin/bash

temp() {
	tempstat="$(sensors | grep -m 1 temp1 | awk '{gsub(/\+/,"")}1''{print $2}')"
	    if [[ $tempstat = 40 ]] ; then
	    temp=""
	    elif [[ $tempstat > 40 ]] ; then
	    temp=" "
	    elif [[ $tempstat > 60 ]] ; then
	    temp=" "
	    elif [[ $tempstar > 80 ]] ; then
	    temp=" "
	    elif [[ $tempstat > 90 ]] ; then
	    tempstat=" "
	    fi

	    echo "$tempstat $temp"
}

echo "$(temp)"
