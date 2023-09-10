#!/bin/bash

# curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -



# Function to calculate average ping time
ping_time() {
  total_time=0
  for i in {1..5}; do
    ping_output=$(ping -c 1 google.com)
    ping_time=$(echo "$ping_output" | grep time= | cut -d "=" -f4 | cut -d " " -f1)
    total_time=$(echo "$total_time + $ping_time" | bc)
  done
  avg_time=$(echo "$total_time / 5" | bc)
  echo "$avg_time"
}

# Function to calculate download speed
download_speed() {
  download_output=$(curl -s https://speed.hetzner.de/100MB.bin > /dev/null)
  download_speed=$(echo "$download_output" | awk '{speed=$3 $4; printf "%.2f\n", speed/1048576}')
  echo "$download_speed"
}

# Function to calculate upload speed
upload_speed() {
  if [ ! -f test.txt ]; then
    echo "This is a test file for measuring upload speed." > test.txt
  fi
  upload_output=$(curl -s -T test.txt https://file.io)
  upload_speed=$(echo "$upload_output" | awk '{speed=$3 $4; printf "%.2f\n", speed/1048576}')
  echo "$upload_speed"
}

# Call functions and store their output in variables
avg_ping=$(ping_time)
dl_speed=$(download_speed)
ul_speed=$(upload_speed)

# Output results
echo "Average ping time: $avg_ping ms"
echo "Download speed: $dl_speed MB/s"
echo "Upload speed: $ul_speed MB/s"

