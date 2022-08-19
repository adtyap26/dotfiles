#!/bin/bash

interface="wlp1s0"
icon=" "

while true
do
        R1=`cat /sys/class/net/$interface/statistics/rx_bytes`
        T1=`cat /sys/class/net/$interface/statistics/tx_bytes`
        sleep 1
        R2=`cat /sys/class/net/$interface/statistics/rx_bytes`
        T2=`cat /sys/class/net/$interface/statistics/tx_bytes`
        TBPS=`expr $T2 - $T1`
        RBPS=`expr $R2 - $R1`
        TKBPS=`expr $TBPS / 1024`
        RKBPS=`expr $RBPS / 1024`
        echo "$icon  :$TKBPS kB/s   :$RKBPS kB/s"
done
