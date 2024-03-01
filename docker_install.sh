#!/bin/bash

# Script to install Docker and Docker Compose on Ubuntu 22.04

# Update the apt package list
sudo apt update -y

# Install packages to allow apt to use a repository over HTTPS
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker’s official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker repository to APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update the apt package list (again)
sudo apt update -y

# Install Docker
sudo apt install -y docker-ce

# Enable Docker to start on boot
sudo systemctl enable docker

# Add current user to Docker group to allow executing Docker commands without sudo
sudo usermod -aG docker $USER

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/v2.5.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# if failed, uninstall and reinstall, `sudo rm /usr/local/bin/docker-compose`

# Print Docker and Docker Compose versions
docker --version
docker-compose --version

echo "Docker and Docker Compose installation completed!"
