#!/bin/bash

# Get the count of new emails
maildir="$HOME/.local/share/mail/aditya@permaditya.my.id/INBOX/new/"
# new_email_count=$(himalaya | awk '/✷/ { print }' | wc -l)
new_email_count=$(find $maildir -type f | wc -l)

# Check if there are new emails and display the appropriate icon
if [ "$new_email_count" -gt 0 ]; then
    echo " $new_email_count"
else
    echo "󰶈 "
fi

