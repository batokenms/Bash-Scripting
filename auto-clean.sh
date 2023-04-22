#!/bin/bash

# Update packages and install security patches
sudo apt-get update
sudo apt-get upgrade -y

# Clear old package cache
sudo apt-get autoclean
sudo apt-get clean

# Remove old versions
sudo apt-get autoremove -y
