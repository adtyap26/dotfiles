#!/bin/bash

# Loop through each file matching the pattern
for file in latency-*.txt/*/PM_ADI/latency.txt; do
    # Extract the directory name two levels above
    dirname=$(basename "$(dirname "$(dirname "$(dirname "$file")")")")

    # Extract the word similar to the directory name
    word=$(echo "$dirname" | cut -d'-' -f2)

    # Prepend the word to the first line of the latency.txt file
    sed -i "1s/^/$word\n/" "$file"
done

