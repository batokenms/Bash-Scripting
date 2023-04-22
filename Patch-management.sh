#!/bin/bash

# Update packages and install security patches
sudo apt-get update
sudo apt-get upgrade -y

# Check for and install unattended-upgrades
if ! command -v unattended-upgrade &> /dev/null; then
    echo "Installing unattended-upgrades..."
    sudo apt-get install -y unattended-upgrades
    sudo dpkg-reconfigure -plow unattended-upgrades
else
    echo "unattended-upgrades is already installed"
fi
