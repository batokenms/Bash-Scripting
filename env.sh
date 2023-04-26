#!/bin/bash

# Patch management
echo "Performing system update and patch management"
sudo apt update && sudo apt upgrade -y

# Clean cache
echo "Cleaning up package cache"
sudo apt clean

# Remove old packages
echo "Removing old packages"
sudo apt autoremove -y

# Check if Docker is installed
if ! command -v docker > /dev/null 2>&1; then
  echo "Docker is not installed. Installing now."
  sudo apt install docker.io -y >> trash.txt 2>&1
else
  echo "Docker is already installed"
fi

# Check if Git is installed
if ! command -v git > /dev/null 2>&1; then
  echo "Git is not installed. Installing now."
  sudo apt install git -y >> trash.txt 2>&1
else
  echo "Git is already installed"
fi

# Check if Wget is installed
if ! command -v wget > /dev/null 2>&1; then
  echo "Wget is not installed. Installing now."
  sudo apt install wget -y >> trash.txt 2>&1
else
  echo "Wget is already installed"
fi

# Check if Curl is installed
if ! command -v curl > /dev/null 2>&1; then
  echo "Curl is not installed. Installing now."
  sudo apt install curl -y >> trash.txt 2>&1
else
  echo "Curl is already installed"
fi

# Check if Terraform is installed
if ! command -v terraform > /dev/null 2>&1; then
  echo "Terraform is not installed. Installing now."
  sudo apt install terraform -y >> trash.txt 2>&1
else
  echo "Terraform is already installed"
fi

# Check if Ansible is installed
if ! command -v ansible > /dev/null 2>&1; then
  echo "Ansible is not installed. Installing now."
  sudo apt install ansible -y >> trash.txt 2>&1
else
  echo "Ansible is already installed"
fi

# Check if Apache is installed
if ! command -v apache2 > /dev/null 2>&1; then
  echo "Apache is not installed. Installing now."
  sudo apt install apache2 -y >> trash.txt 2>&1
else
  echo "Apache is already installed"
fi

# Check if Nginx is installed
if ! command -v nginx > /dev/null 2>&1; then
  echo "Nginx is not installed. Installing now."
  sudo apt install nginx -y >> trash.txt 2>&1
else
  echo "Nginx is already installed"
fi

# Check if Docker-compose is installed
if ! command -v docker-compose > /dev/null 2>&1; then
  echo "Docker-compose is not installed. Installing now."
  sudo apt install docker-compose -y >> trash.txt 2>&1
else
  echo "Docker-compose is already installed"
fi

# Check and start Docker service
if sudo systemctl is-active --quiet docker; then
  echo "Docker service is already running"
else
  echo "Docker service is not running. Starting Docker service"
  sudo systemctl start docker
fi

# Check and enable Docker service
if sudo systemctl is-enabled --quiet docker; then
  echo "Docker service is already enabled"
else
  echo "Docker service is not enabled. Enabling

