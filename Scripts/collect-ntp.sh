#!/bin/bash

output_file="ntp_summary.txt"

rm -f "$output_file"

for file in ntp-*.txt/*/PM_ADI/ntp.txt; do
    hostname=$(basename "$(dirname "$(dirname "$file")")")
    
    ntp_stats=$(grep "NTP service:" "$file")
    
    echo "$hostname $ntp_stats" >> "$output_file"
done

echo "Data gathered from ntp.txt files and saved to $output_file"

