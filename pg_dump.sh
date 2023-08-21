# Ask for the host, with default value 127.0.0.1
read -p "Please enter the host (default 127.0.0.1): " host
host=${host:-127.0.0.1}

# Ask for the port, with default value 5432
read -p "Please enter the port (default 5432): " port
port=${port:-5432}

# Ask for the db name, no default value
read -p "Please enter the db name: " dbname

# Ask for the username, no default value
read -p "Please enter the username: " username

# Ask for the output path, with auto-complete feature
read -e -p "Please enter the output path: " output_path

echo "Please enter the database password:"

# Run the pg_dump command
pg_dump --host $host --port $port --dbname $dbname --username $username --password> $output_path


