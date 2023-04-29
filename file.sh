#!/bin/bash

# Define the directory to manage
DIRECTORY=/root/wahome

# Set the file permissions for the directory
chmod 755 $DIRECTORY

# Create a new file in the directory with read/write permissions for the owner
touch $DIRECTORY/newfile.txt
chmod 600 $DIRECTORY/newfile.txt

# List all files in the directory and their permissions
ls -l $DIRECTORY

# Delete any files in the directory that are older than 30 days
find $DIRECTORY -type f -mtime +30 -exec rm {} \;
