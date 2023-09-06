# Ask for the username, no default value
read -p "Please enter the username: " username

read -p "Please enter the docker container name: " dockername

# Run the pg_dump command
sudo docker exec -t $dockername pg_dumpall -c -U $username > dump_`date +%Y-%m-%d-"_"%H_%M_%S`.sql



