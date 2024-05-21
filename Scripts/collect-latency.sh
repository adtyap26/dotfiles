#!/bin/bash

output_file="latency_summary.txt"

# Clear the output file
rm -f "$output_file"

for file in latency-*.txt/*/PM_ADI/latency.txt; do
    # Get the first line which contains the directory name
    directory_name=$(head -n 1 "$file")
    
    # Extract DNS names and average latency from each line starting with "HOST:"
    dns_avg=$(grep -E '^  [0-9]+\.\|' "$file" | awk '{sub(/\.$/, "", $2); print $2, $8}')

    # Write the directory name, DNS names, and average latency to the output file
    echo "$directory_name" >> "$output_file"
    echo "$dns_avg" | while read -r line; do
        echo "$line" >> "$output_file"
    done
done

echo "Summary written to $output_file"

