#!/bin/bash

output_file="ram_summary.txt"

rm -f "$output_file"

for file in ram-*.txt/*/PM_ADI/ram.txt; do
    hostname=$(basename "$(dirname "$(dirname "$file")")")
    
    total_memory=$(grep "Mem:" "$file" | awk '{print $2}')
    used_memory=$(grep "Mem:" "$file" | awk '{print $3}')
    
    echo "$hostname $total_memory $used_memory" >> "$output_file"
done

echo "Data gathered from ram.txt files and saved to $output_file"

