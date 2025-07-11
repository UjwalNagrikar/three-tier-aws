#!/bin/bash
# Update the package repository
sudo apt update -y

# Install Apache Web Server
sudo apt install -y apache2

# Enable and start Apache service
sudo systemctl enable apache2
sudo systemctl start apache2

# Create a simple HTML page
echo "<h1>Welcome to the Three-Tier Architecture App - Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
