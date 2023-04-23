#!/bin/bash

# Set the username
USERNAME="yemi-kjibua"

# Check if the user exists
if id "$USERNAME" >/dev/null 2>&1; then
  echo "User $USERNAME already exists"
else
  # Create a new user
  useradd -m -s /bin/bash -c "Yemi Kjibua" $USERNAME
fi

# Prevent the user from deleting root files and directories
echo "$USERNAME hard / rm,chown,chgrp,suid,chmod,chroot" >> /etc/security/limits.conf

# Set permissions for files and directories in the user's home directory
chmod 777 /home/$USERNAME/*

# Set a file size limit for the user
echo "$USERNAME hard fsize 1048576" >> /etc/security/limits.conf

# Restrict the user from deleting files and directories in their own home directory
chattr +i /home/$USERNAME/*
