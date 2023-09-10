#!/bin/bash

# Prompt the user to choose between converting a single file or an entire directory
echo "Do you want to convert a single file or an entire directory?"
select option in "Single file" "Entire directory"; do
    case $option in
        "Single file")
            # Prompt the user for the path to the PNG or JPG file
            read -p "Enter the path to the PNG or JPG file: " file_path
            # Create a new ZIP file and add the PNG or JPG file to it
            zip -j "${file_path%.*}.cbr" "$file_path"
            break
            ;;
        "Entire directory")
            # Create a new ZIP file and add the PNG and JPG files to it
            find . -type f \( -iname \*.png -o -iname \*.jpg \) -print0 | while IFS= read -r -d '' file; do
                echo "Adding file: $file"
                zip -j "./$(basename "$(pwd)").cbr" "$file"
            done
            echo "CBR file created: $(basename "$(pwd)").cbr"
            break
            ;;
        *) echo "Invalid option. Please choose 1 or 2.";;
    esac
done

