#!/bin/bash

# Set your Telegram bot token and chat ID
bot_token="5908119286:AAEa1Eme_OQQilzWU4SZTrh4Np5qQjYhVRg"
chat_id="401430605"

# Define the URLs to monitor
url1="https://permaditya.my.id"
url2="https://wacanaindonesia.com"
url3="https://sintaksis.agency"
# Function to check the URL and send notifications if necessary
check_url() {
  local url=$1
  local response=$(curl -s -o /dev/null -w "%{http_code}" "$url")

  # Check if the response code indicates that the server is down or not 200
  if [[ $response != 200 ]]; then
    # Server is down or not returning 200 status code, send a notification
    local message="Server is down or returned a non-200 status code! Response code: $response"
    notify-send -i /home/permaditya/Apps/Tokyo-Night-GTK-Theme/icons/Tokyonight-Dark/actions/16/error.svg "Server is down, Sir! Please check."
    curl -s -X POST "https://api.telegram.org/bot$bot_token/sendMessage" -d "chat_id=$chat_id" -d "text=$message"
  fi
}

# Call the function for the first URL
check_url "$url1"

# Call the function for the second URL
check_url "$url2"

# call the function for the third URL
check_url "$url3"
