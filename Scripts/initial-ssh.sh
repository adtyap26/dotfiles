#!/bin/bash

# List of server IP addresses or hostnames
servers=(
  "172.168.10.26" 
  "172.168.10.27" 
  "172.168.10.28" 
  "172.168.10.29" 
  "172.168.10.32" 
  "172.168.10.33"
  "172.168.10.34"
  "172.168.10.35"
  "172.168.10.36"
  "172.168.10.37"
  "172.168.10.38"
  "172.168.10.39"
)

# Path to your private key
private_key=~/.ssh/repenv

# SSH port
ssh_port=22

# Password for SSH login
password="p@ssw0rd"

# Loop through each server and SSH with private key
for server in "${servers[@]}"; do
    echo "Connecting to $server..."
    sshpass -p "$password" ssh -i $private_key -oStrictHostKeyChecking=yes -p $ssh_port root@$server
    # Add a delay (optional)
    sleep 3
    # Close the SSH connection
    echo "Closing connection to $server..."
    ssh -oStrictHostKeyChecking=no -p $ssh_port root@$server exit
done

echo "All connections completed."
