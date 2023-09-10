#!/bin/bash

# Check the status of the Cloudflare connection
status=$(warp-cli status)

# Check if the connection is successful and "Connected"
if [[ $status =~ "Status update: Connected" ]] && [[ $status =~ "Success" ]]; then
    echo " 1.1.1.1"
fi

