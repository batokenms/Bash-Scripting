#!/bin/bash

# Check if you are the Root
if ["${EUID}" -ne 0 ]; then
    echo "Please run as the Root"
    exit 

else
    echo "You are the Root and you are good to go"
fi

# Update packages and install security patches
sudo apt-get update
sudo apt-get upgrade -y

# Clear old package cache
sudo apt-get autoclean
sudo apt-get clean

# Remove old versions
sudo apt-get autoremove -y
