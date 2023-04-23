#!/bin/bash

# Open ports 80 and 443
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Enable the firewall
sudo ufw enable
