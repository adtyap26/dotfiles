#!/bin/bash

# Usage function 

usage() {
echo "Usage: $0 [-i <input-file>] [-o <output-file]"
echo ""
echo "Options:"
echo " -i, --input-file Input file to be converted"
echo " -o, --output-file Output file (PDF) name"
echo " -h, --help Display this help message"
exit 1
}

# Parse command line Options
while [ "$1" != "" ]; do
case $1 in
-i | --input-file) shift
input_file=$1
;;
-o | --output-file ) shift
output_file=$1
;;
-h | --help ) usage
;;
* ) usage
esac
shift
done

# Check if input file is not specified
if [ -z "$input_file" ]; then
  echo "No input file specified, selecting from the current directory."
  input_file=$(gum file)
  if [ $? -ne 0 ]; then
    # Check exit code directly with e.g. 'if ! mycmd;', not indirectly with $?. 
    echo "Error: gum command failed."
    exit 1
  fi
fi

if [ -z "$output_file" ]; then
echo "Converting ${input_file%.} into pdf"
gum spin --spinner dot --title "Please wait..." -- sleep 2
output_file="${input_file%.}.pdf"
fi
# Check if input file to PDF using LibreOFfice
libreoffice --headless --convert-to pdf "$input_file" --outdir "$(dirname "$output_file")"
