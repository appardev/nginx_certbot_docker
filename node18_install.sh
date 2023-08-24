# Download Node.js binary
wget https://nodejs.org/dist/v18.14.0/node-v18.14.0-linux-x64.tar.xz

# Extract the binary
tar -xf node-v18.14.0-linux-x64.tar.xz

# Copy to /usr/local
sudo cp -r node-v18.14.0-linux-x64/* /usr/local/

# Clean up downloaded files
rm -rf node-v18.14.0-linux-x64*

node -v

sudo npm install -g pm2
pm2 --version

sudo npm install -g pnpm
pnpm --version


