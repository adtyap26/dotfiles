#!/bin/bash

output_file="cpu_summary.txt"

rm -f "$output_file"

for file in cpu-*.txt/*/PM_ADI/cpu.txt; do
    hostname=$(basename "$(dirname "$(dirname "$file")")")
    cpu_value=$(<"$file")

    echo "${hostname},${cpu_value}" >> "$output_file"
done

echo "Data gathered from cpu.txt files and saved to $output_file"

