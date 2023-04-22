#!/bin/bash

# Check if server is synchronized to UTC time
if timedatectl status | grep "Time zone"; then
    echo "Server is synchronized to UTC time."

    # Change time zone to Eastern Time
    echo "Changing time zone from UTC to ET..."
    sudo timedatectl set-timezone America/New_York
    echo "Time zone changed to ET."
else
    echo "Server is not synchronized to UTC time. No action taken."
fi
