#!/bin/bash

# Import Jenkins Key
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5BA31D57EF5975CA

# Update System
sudo apt update
sudo apt upgrade -y

# Install Java
sudo apt install openjdk-11-jdk -y

# Add Jenkins Repository
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update Package List
sudo apt update

# Install Jenkins
sudo apt install jenkins -y

# Start and Enable Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Print the Initial Admin Password
echo "Unlock Jenkins with the following password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo "Visit http://your_server_ip:8080 to complete the installation."
