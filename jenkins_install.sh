#!/bin/bash

# Update System
sudo apt update
sudo apt upgrade -y

# Install Dependencies
sudo apt install software-properties-common apt-transport-https wget -y

# Install Java
sudo apt install openjdk-11-jdk -y

# Add Jenkins Repository Key
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -

# Add Jenkins Repository
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update Package List
sudo apt install ca-certificates
sudo apt update

# Install Jenkins
sudo apt install jenkins -y

# Start and Enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Print the Initial Admin Password
echo "Unlock Jenkins with the following password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo
