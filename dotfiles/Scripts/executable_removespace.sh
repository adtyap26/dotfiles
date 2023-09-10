#!/bin/bash

# loop through all files and directories in current directory
for item in *; do
  # check if item is a file or directory
  if [ -f "$item" ] || [ -d "$item" ]; then
    # check if item contains space(s)
    if [[ "$item" == *" "* ]]; then
      # replace space(s) with underscore
      newname=$(echo "$item" | tr ' ' '_')
      # rename the file or directory
      mv "$item" "$newname"
      echo "Renamed $item to $newname"
    fi
  fi
done

