#!/bin/sh
#requirements: zenity, mpv, acpi, https://www.freesoundslibrary.com/positive-tone-sound-effect/, 
count=0 #timer after critical battery range is reached
export DISPLAY=:0 #capture the right monitor to display the popups

#read in status and number charge
read -r status capacity <<<$(acpi -b | awk -F'[,:%]' '{print $2, $3}')

#check if on battery and between 0-4%
if [[ $status == "Discharging" && "$capacity" -le 4 ]]; then 
    logger "Critical battery threshold"
    zenity --warning --height=100 --width=200 --title "Battery Critically Low" --text "Laptop will hibernate in 90 seconds. Please plug in a charger." &
    while [[ $status == "Discharging" && "$count" -le 90 ]]
    do
        sleep 5
        let "count+=5"
        if [[ "$count" -eq 90 ]]; then
            systemctl suspend
        fi
        read -r status capacity <<<$(acpi -b | awk -F'[,:%]' '{print $2, $3}') #reread the status
    done
#check if low battery eg below 15%
elif [[ $status == "Discharging" && "$capacity" -le 30 ]]; then 
    logger "Low Battery"
    zenity --warning  --height=100 --width=200 --title "Battery Low" --text "Battery is low. Please find a power source (Remaining = $capacity%)" &

#check if fully charged
elif [[ $status == "Charging" && "$capacity" -eq 100 ]]; then 
    zenity --info --height=100 --width=200 --title "Battery Charged" --text "Battery is fully charged (100%)"
fi

