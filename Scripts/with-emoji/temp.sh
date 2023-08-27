#!/bin/bash

temp() {
	tempstat="$(sensors | grep -m 1 temp1 | awk '{gsub(/\+/,"")}1''{print $2}')"
	    if [[ $tempstat > 30 ]] && [[ $tempstat < 40 ]] ; then
	    tempt=""
	    elif [[ $tempstat > 40.5 ]] && [[ $tempstat < 49.9 ]] ; then
	    temp=""
	    elif [[ $tempstat > 50 ]] && [[ $tempstat < 69.9 ]] ; then
	    temp=""
	    elif [[ $tempstar > 70 ]]  ; then
	    temp=""
	    fi

	    echo "$temp $tempstat"
}
echo "$(temp)"
