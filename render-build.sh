#!/bin/bash
echo "Updating package lists..."
apt-get update

echo "Installing Nginx..."
apt-get install -y nginx

echo "Making start.sh executable..."
chmod +x start.sh

echo "Running start.sh..."
./start.sh

chmod +x render-build.sh
