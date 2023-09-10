#!/bin/sh

# get the name of the active wired or WiFi connection
CONNAME=$(nmcli -a | grep 'Wired connection' | awk 'NR==1{print $1}')
if [ "$CONNAME" = "" ]; then
    CONNAME=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -c 5-)
fi

# get the interface to use for network speed
interface="wlp1s0"

while true
do
    # get the current bytes received and transmitted
    R1=`cat /sys/class/net/$interface/statistics/rx_bytes`
    T1=`cat /sys/class/net/$interface/statistics/tx_bytes`
    sleep 1

    # get the bytes received and transmitted after one second
    R2=`cat /sys/class/net/$interface/statistics/rx_bytes`
    T2=`cat /sys/class/net/$interface/statistics/tx_bytes`

    # calculate the transfer rates in bytes and kilobytes per second
    TBPS=`expr $T2 - $T1`
    RBPS=`expr $R2 - $R1`
    TKBPS=`expr $TBPS / 1024`
    RKBPS=`expr $RBPS / 1024`

    # output the connection name and transfer rates
    if [ "$CONNAME" = "" ]; then
        printf "  No Connection  :$RKBPS  :$TKBPS kB/s\n" 
    else
        (( ${#CONNAME} > 5 )) && CONNAME="${CONNAME:0:5}..."
        printf "  $CONNAME   :$RKBPS  :$TKBPS Kb/s\n"
    fi
done

