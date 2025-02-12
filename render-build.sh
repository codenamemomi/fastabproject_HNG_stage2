#!/bin/bash

echo "Installing dependencies..."
pip install --no-cache-dir -r requirements.txt  # Ensure Uvicorn is installed

echo "Building Nginx Docker Image..."
docker build -t my-nginx .

echo "Running start.sh..."
chmod +x start.sh
./start.sh
