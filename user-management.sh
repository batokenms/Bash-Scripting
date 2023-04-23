#!/bin/bash

# Create a new user
FIRST_NAME="yemi"
LAST_NAME="ajubua"
USERNAME="yemi-ajibua"
PASSWORD="1234rt%43*"
useradd -m -s /bin/bash -c "$FIRST_NAME $LAST_NAME" $USERNAME

# Set the user's password
echo "$USERNAME:$PASSWORD" | chpasswd

# Set the password to expire after 90 days
chage -M 90 $USERNAME

# Add the user to the sudoers file and require NOPASSWD
echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USERNAME

# Create the wheel group if it doesn't exist
if ! grep -q wheel /etc/group; then
  groupadd wheel
fi

# Add the user to the wheel group
usermod -aG wheel $USERNAME

# Add the user to the docker group
usermod -aG docker $USERNAME
