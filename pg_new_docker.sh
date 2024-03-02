#!/bin/bash

# Ask for the project code
read -p "Please enter the project code (e.g. dsm): " project_code

# Ask for the environment (beta/alpha/beta-clone)
read -p "Please enter the environment (e.g. beta/alpha/beta_clone/prod_230906): " env

# Ask for other notes (optional)
read -p "Please enter any other notes (optional): " other_note

read -p "Custom db name (press enter if want to auto generate): " custom_db_name

# Construct the database name
db_name="${project_code}_${env}_db"
if [ -n "$other_note" ]; then
  db_name="${db_name}_${other_note}"
fi

if [ -n "$custom_db_name" ]; then
  db_name="$custom_db_name"
fi

# Construct the Docker container name
docker_container_name="${project_code}_${env}_db"
if [ -n "$other_note" ]; then
  docker_container_name="${docker_container_name}_${other_note}"
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
sudo docker run --name $docker_container_name -p $external_port:5432 -e POSTGRES_USER=$user -e POSTGRES_PASSWORD=$password -e POSTGRES_DB=$db_name -d -v ~/pgdata/$docker_container_name:/var/lib/postgresql/data postgres:$postgresql_version

echo ""
echo "Copy and paste the following command to replicate the creation of the PostgreSQL container:"
echo "`sudo docker run --name $docker_container_name -p $external_port:5432 -e POSTGRES_USER=$user -e POSTGRES_PASSWORD=$password -e POSTGRES_DB=$db_name -d -v ~/pgdata/$docker_container_name:/var/lib/postgresql/data postgres:$postgresql_version`"
echo ""


echo "PostgreSQL container has been successfully set up!"

