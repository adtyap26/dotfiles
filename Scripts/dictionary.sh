#!/bin/bash

# Prompt the user for the word
choice=$(gum input --placeholder 'Enter the word')

# Display spinner while looking up definition
gum spin --spinner dot --title "Looking for definition..." -- sleep 1 &

# Use dict command and store output in summary variable
summary=$(dict "$choice")

# Check if dict command was successful and display definition or error message
if [ -z "$summary" ]; then
  exit 2
else
  gum pager --help.foreground="123" --line-number.foreground="111" --border-foreground="111" <<< "$summary"
fi

