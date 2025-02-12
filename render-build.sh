#!/bin/bash

echo "Updating package lists (Not needed in Render, skipping)..."
# sudo apt-get update  # REMOVE: Not needed in Render

echo "Installing dependencies..."
pip install --no-cache-dir -r requirements.txt  # Ensure Uvicorn is installed

echo "Checking if Nginx is installed..."
if ! command -v nginx &> /dev/null
then
    echo "Nginx not found. Installing..."
    apt-get update && apt-get install -y nginx
else
    echo "Nginx is already installed."
fi

echo "Making start.sh executable..."
chmod +x start.sh

echo "Running start.sh..."
./start.sh
