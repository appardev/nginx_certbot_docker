# Ask for the sql path, with auto-complete feature
read -e -p "Please enter the sql path: " sql_path

read -p "Please enter the docker container name: " dockername

# Ask for the db name, no default value
read -p "Please enter the db name: " dbname

# Ask for the username, no default value
read -p "Please enter the username: " username

# Ask for the password, no default value
echo "Please enter the database password:"

# Run the pg_restore command
cat $sql_path | docker exec -i $dockername psql -U $username --dbname $dbname
