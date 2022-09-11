#!/bin/bash

temp() {
	tempstat="$(sensors | grep -m 1 temp1 | awk '{gsub(/\+/,"")}1''{print $2}')"



	if [[ $tempstat > 30.0 ]] && [[ $tempstat < 39.9 ]] ; then
	    temp=""
	elif [[ $tempstat > 40.0 ]] && [[ $tempstat < 49.9 ]] ; then
		temp=""
	elif [[ $tempstat > 50.0 ]] && [[ $tempstat < 69.9 ]] ; then
		temp=""
	elif [[ $tempstat > 70.0 ]] && [[ $tempstat < 90.0 ]] ; then
		temp="⚠️"
	fi

	echo "$temp $tempstat"
}
echo "$(temp)"
