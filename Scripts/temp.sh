#!/bin/bash

temp() {
	tempstat="$(sensors | grep -m 1 temp1 | awk '{print $2}')"
	    if [[ $tempstat=40.0 ]] ; then
	    temp=""
	    elif [[ $tempstat>=40 ]] ; then
	    temp=" "
	    elif [[ $tempstat>=60 ]] ; then
	    temp=" "
	    elif [[ $tempstar>=80 ]] ; then
	    temp=" "
	    elif [[ $tempstat>=96 ]] ; then
	    tempstat=" "
	    fi

	    echo "$tempstat $temp"
}

echo "$(temp)"
