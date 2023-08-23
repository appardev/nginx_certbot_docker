#!/bin/bash

# Update System
sudo apt update
sudo apt upgrade -y

# Install Java
sudo apt install openjdk-11-jdk -y

# Add Jenkins Repository
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Install Jenkins
sudo apt update
sudo apt install jenkins -y

# Start and Enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Print the Initial Admin Password
echo "Unlock Jenkins with the following password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "Visit http://your_server_ip:8080 to complete the installation."
