#!/bin/bash

if ! command -v exiftool &> /dev/null; then
    echo "Error: exiftool not found. Please install exiftool."
    exit 1
fi

shopt -s nullglob
arw_files=(./*.ARW)
if [ ${#arw_files[@]} -eq 0 ]; then
    echo "No ARW files found in the current directory."
    exit 1
fi

counter=1

for file in ./*.ARW; do
    output_file="picture$(printf "%02d" $counter).jpg"
    
    exiftool -b -PreviewImage "$file" > "$output_file"
    
    echo "Converted $file to $output_file"
    
    ((counter++))
done

echo "Conversion completed."

