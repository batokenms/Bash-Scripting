#!/bin/bash

# Add a new user
echo "Enter username to create:"
read username
adduser $username
echo "User $username created."

# Change user password
echo "Enter username to change password:"
read username
passwd $username
echo "Password changed for user $username."

# Delete user
echo "Enter username to delete:"
read username
deluser $username
echo "User $username deleted."
