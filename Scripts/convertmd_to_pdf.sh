#!/bin/bash

convert_to_pdf() {
  pandoc $1 -s -o $2
}

# Get a list of all markdown files in the current directory
files=$(ls *.md)

# Get the total number of files
num_files=$(echo $files | wc -w)

# Initialize the counter variable
count=1

# Loop through all markdown files
for file in $files
do
  # Show the progress bar
  echo -ne "Converting file $count/$num_files\r"

  # Convert the markdown file to a PDF
  convert_to_pdf $file ${file%.md}.pdf

  # Increment the counter variable
  count=$((count+1))
done

# Print a newline after the progress bar
echo

