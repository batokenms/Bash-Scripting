#!/bin/bash

# Patch management
sudo apt update -y >> trash.txt 2>&1
sudo apt upgrade -y >> trash.txt 2>&1

# Clean cache and remove outdated packages
sudo apt autoremove -y >> trash.txt 2>&1
sudo apt autoclean -y >> trash.txt 2>&1

# Check if Maven is installed
if ! command -v mvn > /dev/null 2>&1; then
  echo "Maven is not installed. Installing now."
  sudo apt install maven -y >> trash.txt 2>&1
else
  echo "Maven is already installed"
fi

# Check if Java JDK 11 is installed
if ! command -v java > /dev/null 2>&1 || ! java -version 2>&1 | grep -q '11\.'; then
  echo "Java JDK 11 is not installed. Installing now."
  sudo apt install openjdk-11-jdk -y >> trash.txt 2>&1
else
  echo "Java JDK 11 is already installed"
fi

# Check if Docker is installed and service is started and enabled
if ! command -v docker > /dev/null 2>&1 || ! systemctl is-active --quiet docker; then
  echo "Docker is not installed or service is not started and enabled. Installing and starting now."
  sudo apt install docker.io -y >> trash.txt 2>&1
  sudo systemctl start docker >> trash.txt 2>&1
  sudo systemctl enable docker >> trash.txt 2>&1
else
  echo "Docker is already installed and service is started and enabled"
fi

# Install remaining packages
if ! command -v ansible > /dev/null 2>&1; then
  echo "Ansible is not installed. Installing now."
  sudo apt install ansible -y >> trash.txt 2>&1
else
  echo "Ansible is already installed"
fi

if ! command -v docker-compose > /dev/null 2>&1; then
  echo "Docker Compose is not installed. Installing now."
  sudo apt install docker-compose -y >> trash.txt 2>&1
else
  echo "Docker Compose is already installed"
fi

if ! command -v terraform > /dev/null 2>&1; then
  echo "Terraform is not installed. Installing now."
  sudo apt install terraform -y >> trash.txt 2>&1
else
  echo "Terraform is already installed"
fi

if ! command -v wget > /dev/null 2>&1; then
  echo "Wget is not installed. Installing now."
  sudo apt install wget -y >> trash.txt 2>&1
else
  echo "Wget is already installed"
fi

if ! command -v curl > /dev/null 2>&1; then
  echo "Curl is not installed. Installing now."
  sudo apt install curl -y >> trash.txt 2>&1
else
  echo "Curl is already installed"
fi
