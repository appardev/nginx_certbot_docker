#!/bin/bash

# Ask for the project code
read -p "Please enter the project code (e.g. dsm): " project_code

# Ask for the environment (beta/alpha/beta-clone)
read -p "Please enter the environment (beta/alpha/beta_clone): " env

# Ask for other notes (optional)
read -p "Please enter any other notes (optional): " other_note

# Construct the database name
db_name="${project_code}_${env}_db"
if [ -n "$other_note" ]; then
  db_name="${db_name}_${other_note}"
fi

# Ask for the external port, with default value 5432
read -p "Please enter the external port (default 5432): " external_port
external_port=${external_port:-5432}

# Ask for the user
read -p "Please enter the user (default 'appar'): " user
user=${user:-appar}

# Ask for the password
read -p "Please enter the password (default 'iloveappar'): " password
password=${password:-iloveappar}
echo # Add newline after password input

# Ask for the PostgreSQL version, with default value 12.9
read -p "Please enter the PostgreSQL version (default 12.9): " postgresql_version
postgresql_version=${postgresql_version:-12.9}

# Run the Docker command
sudo docker run --name $db_name -p $external_port:5432 -e POSTGRES_USER=$user -e POSTGRES_PASSWORD=$password -e POSTGRES_DB=$db_name -d postgres:$postgresql_version

echo "PostgreSQL container has been successfully set up!"

