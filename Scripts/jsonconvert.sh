#!/bin/bash

# Prompt the user to enter the input file name and input_file is a user define variable
read -p "Enter the name of the JSON file: " input_file

# Define the output file name
output_file="letters.txt"

# Use jq to extract the header row and use tab-delimited
header_row="No\tDate\tIn/Out\tRegistration\tSender\tRecipient\tFilename"

# Use jq to extract the data rows
data_rows=$(jq -r '.[] | [.no, .date, .in_out, .registration, .sender, .recipient, .file_name] | @tsv' "$input_file")

# Combine the header row and data rows into the output file
echo -e "$header_row" > "$output_file"
echo -e "$data_rows" >> "$output_file"

# Notify the user that the conversion is complete
echo "The JSON data has been converted to a tab-delimited text file ($output_file)"

