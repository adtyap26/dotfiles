#!/bin/bash

output_file="hdparm_summary.txt"

rm -f "$output_file"

for file in hdparm-*.txt/*/PM_ADI/hdparm.txt; do
    hostname=$(basename "$(dirname "$(dirname "$file")")")
    
    buffered_reads=$(grep "Timing buffered disk reads" "$file")
    cached_reads=$(grep "Timing cached reads" "$file")
    
    echo "$hostname $buffered_reads $cached_reads" >> "$output_file"
done

echo "Data gathered from hdparm.txt files and saved to $output_file"

