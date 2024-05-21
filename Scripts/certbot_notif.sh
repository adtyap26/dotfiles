#!/bin/bash

# Your Telegram bot token and chat ID
bot_token="5908119286:AAEa1Eme_OQQilzWU4SZTrh4Np5qQjYhVRg"
chat_id="401430605"


# Run Certbot to get certificate information
certbot_info=$(sudo certbot certificates)

# Extract domain and expiration date
domain=$(echo "$certbot_info" | grep "Domains: " | awk '{print $2}')
expiry_date=$(echo "$certbot_info" | grep -A2 "Expiry Date" | grep -oP 'Expiry Date: \K.*')

# Convert expiration date to UNIX timestamp
expiry_timestamp=$(date -d "$expiry_date" +%s)

# Calculate time until expiration (in seconds)
current_timestamp=$(date +%s)
time_until_expiry=$((expiry_timestamp - current_timestamp))

# Set threshold for notification (e.g., 7 days before expiration)
threshold=$((7 * 24 * 60 * 60))  # 7 days in seconds

# Compare time until expiry with threshold
if [ "$time_until_expiry" -lt "$threshold" ]; then
    # Send a notification to Telegram bot
    message="Certificate Expiry Alert: SSL certificate for $domain will expire in less than 7 days."
    curl -s -X POST "https://api.telegram.org/bot$bot_token/sendMessage" -d "chat_id=$chat_id&text=$message"
fi
