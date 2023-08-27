#!/bin/bash


#
# # Ask the user for the manual page to search
#  # read -p "Enter manual page: " page 
# page=$(zenity --entry --text="Enter manual page:")
#
# # Use tldr to get the summary for the manual page
# # summary=$(tldr $page)
# #
# # # Use rofi to display the summary to the user
# # # echo "$summary" | rofi -theme-str 'window {width: 75%;height: 50%;}' -dmenu -p "tldr $page" 
# #  # echo "$summary" | most  
# # # Use zenity to display the summary to the user
# #
# # zenity --text-info --title="tldr $page" --width=600 --height=400 <<< "$summary"
#
# # Use tldr to get the summary for the manual page
# summary=$(tldr $page)
# if [ $? -ne 0 ]; then
#   zenity --error --text="Error: unable to retrieve summary for manual page '$page'"
#   exit 1
# fi
#
# # Use zenity to display the summary to the user
# zenity --text-info --title="tldr $page" --width=600 --height=400 <<< "$summary"
# if [ $? -ne 0 ]; then
#   zenity --error --text="Error: unable to display summary for manual page '$page'"
#   exit 1
# fi


# Prompt the user for the manual page
page=$(zenity --entry --text="Enter manual page:")

# Use tldr to get the summary for the manual page
summary=$(tldr $page)
if [ $? -ne 0 ]; then
  zenity --error --text="Error: unable to retrieve summary for manual page '$page'"
  exit 1
fi

# Use zenity to display the summary to the user
zenity --text-info --title="tldr $page" --width=600 --height=400 <<< "$summary"
if [ $? -ne 0 ]; then
  zenity --error --text="Error: unable to display summary for manual page '$page'"
  exit 1
fi
