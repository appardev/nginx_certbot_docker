# python3.11
sudo apt update
sudo apt upgrade
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install python3.11
python3.11 --version

# pip
sudo apt install python3.11 python3.11-distutils
curl -sS https://bootstrap.pypa.io/get-pip.py | python3.11

# venv
sudo apt-get install python3.11-dev python3.11-venv