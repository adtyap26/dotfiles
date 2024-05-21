#!/bin/bash

output_file="storage_summary.txt"

rm -f "$output_file"

for file in storage-*.txt/*/PM_ADI/storage.txt; do
    hostname=$(basename "$(dirname "$(dirname "$file")")")
    
    grep '/dev/mapper/vgdata-lvdata' "$file" | sed "s/^/$hostname /" >> "$output_file"
done

echo "Data gathered from storage.txt files and saved to $output_file"

