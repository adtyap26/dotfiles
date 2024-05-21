#!/bin/sh
val=$(cat /sys/class/backlight/intel_backlight/brightness)
if [ "$1" = "+" ] ; then
  val=`expr $val + 50`
else
  val=`expr $val - 50`
fi
echo $val | sudo tee /sys/class/backlight/intel_backlight/brightness
