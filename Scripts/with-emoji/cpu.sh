#!/bin/bash
icon="🖥"
cpu="$(top -b -n1 | grep "Cpu(s)" | awk '{print $2+$4 "%"}' | tail -n1)"
echo -e "$icon $cpu"
