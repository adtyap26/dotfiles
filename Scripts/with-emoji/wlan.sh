#!/bin/sh

wlan_card='wlp1s0'

wlanmon_card=$(ip a s | grep $wlan_card | awk 'NR%1==0 {print $2}' | sed 's/://g')
if [ $wlanmon_card ]; then
    printf " MONITOR"
fi

wlan_online=$(iw $wlan_card link | grep 'Connected' | awk 'NR%1==0 {print $1}')
wlan_offline=$(iw $wlan_card link | grep 'Not' | awk 'NR%1==0 {print $1}')
internet=$(wget -qO- ifconfig.co)
internet_logo=""
if [ $internet ]; then
    internet_logo=" "
else
    internet_logo=" "
fi

if [ $wlan_online ]; then
    R1=`cat /sys/class/net/$interface/statistics/rx_bytes`
    T1=`cat /sys/class/net/$interface/statistics/tx_bytes`
    sleep 1
    R2=`cat /sys/class/net/$interface/statistics/rx_bytes`
    T2=`cat /sys/class/net/$interface/statistics/tx_bytes`
    TBPS=`expr $T2 - $T1`
    RBPS=`expr $R2 - $R1`
    TKBPS=`expr $TBPS / 1024`
    RKBPS=`expr $RBPS / 1024`
    echo " :$RKBPS  :$TKBPS kB/s"

elif [ $wlan_offline ];then
    printf " OFFLINE"
else
    printf " NOADPTR"
fi
