#!/bin/bash
# Update packages and install security patches
sudo apt-get update
sudo apt-get upgrade -y

# Check for and install Docker
if command -v docker &> /dev/null; then
    echo "Docker is already installed"
else
    echo "Installing Docker..."
    sudo apt-get update
    sudo apt-get install -y docker.io
    sudo systemctl start docker
    sudo systemctl enable docker
fi

