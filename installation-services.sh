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

# Check for and install Wget
if command -v wget &> /dev/null; then
    echo "Wget is already installed"
else
    echo "Installing Wget..."
    sudo apt-get install -y wget
fi

# Check for and install Git
if command -v git &> /dev/null; then
    echo "Git is already installed"
else
    echo "Installing Git..."
    sudo apt-get install -y git
fi

# Check for and install MySQL
if command -v mysql &> /dev/null; then
    echo "MySQL is already installed"
else
    echo "Installing MySQL..."
    sudo apt-get install -y mysql-server
    sudo systemctl start mysql
    sudo systemctl enable mysql
fi

# Check for and install Ansible
if command -v ansible &> /dev/null; then
    echo "Ansible is already installed"
else
    echo "Installing Ansible..."
    sudo apt-get update
    sudo apt-get install -y ansible
fi

# Check for and install cURL
if command -v curl &> /dev/null; then
    echo "cURL is already installed"
else
    echo "Installing cURL..."
    sudo apt-get install -y curl
fi

# Check for and install Docker Compose
if command -v docker-compose &> /dev/null; then
    echo "Docker Compose is already installed"
else
    echo "Installing Docker Compose..."
    sudo apt-get update
    sudo apt-get install -y docker-compose
fi

# Check for and install Terraform
if command -v terraform &> /dev/null; then
    echo "Terraform is already installed"
else
    echo "Installing Terraform..."
    sudo apt-get update
    sudo apt-get install -y software-properties-common
    sudo apt-add-repository -y ppa:longsleep/golang-backports
    sudo apt-get update
    sudo apt-get install -y golang-go
    sudo snap install terraform
fi

# Print message after completion
echo "Setup complete"
