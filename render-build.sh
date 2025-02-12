#!/bin/bash

echo "Installing dependencies..."
pip install --no-cache-dir -r requirements.txt  # Ensure Uvicorn is installed

echo "Installing Nginx..."
apt-get update && apt-get install -y nginx  # Install Nginx on Render

echo "Making start.sh executable..."
chmod +x start.sh

echo "Running start.sh..."
./start.sh
