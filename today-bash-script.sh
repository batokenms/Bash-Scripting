#!/bin/bash

# Patch management
sudo apt update -y
sudo apt upgrade -y

# Clean cache and remove outdated packages
sudo apt autoremove -y
sudo apt autoclean -y

# Check if Maven is installed
if ! command -v mvn > /dev/null 2>&1; then
  echo "Maven is not installed. Installing now."
  sudo apt install maven -y
else
  echo "Maven is already installed"
fi

# Check if Java JDK 11 is installed
if ! command -v java > /dev/null 2>&1 || ! java -version 2>&1 | grep -q '11\.'; then
  echo "Java JDK 11 is not installed. Installing now."
  sudo apt install openjdk-11-jdk -y
else
  echo "Java JDK 11 is already installed"
fi

# Check if Docker is installed and service is started and enabled
if ! command -v docker > /dev/null 2>&1 || ! systemctl is-active --quiet docker; then
  echo "Docker is not installed or service is not started and enabled. Installing and starting now."
  sudo apt install docker.io -y
  sudo systemctl start docker
  sudo systemctl enable docker
else
  echo "Docker is already installed and service is started and enabled"
fi

# Install remaining packages
if ! command -v ansible > /dev/null 2>&1; then
  echo "Ansible is not installed. Installing now."
  sudo apt install ansible -y
else
  echo "Ansible is already installed"
fi

if ! command -v docker-compose > /dev/null 2>&1; then
  echo "Docker Compose is not installed. Installing now."
  sudo apt install docker-compose -y
else
  echo "Docker Compose is already installed"
fi

if ! command -v terraform > /dev/null 2>&1; then
  echo "Terraform is not installed. Installing now."
  sudo apt install terraform -y
else
  echo "Terraform is already installed"
fi

if ! command -v wget > /dev/null 2>&1; then
  echo "Wget is not installed. Installing now."
  sudo apt install wget -y
else
  echo "Wget is already installed"
fi

if ! command -v curl > /dev/null 2>&1; then
  echo "Curl is not installed. Installing now."
  sudo apt install curl -y
else
  echo "Curl is already installed"
fi
