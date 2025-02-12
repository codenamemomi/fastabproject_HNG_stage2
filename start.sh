#!/bin/bash

# Print current working directory
echo "Current working directory:"
pwd

# Ensure /tmp directory exists
mkdir -p /tmp

# Ensure nginx.conf exists
if [ ! -f "/etc/nginx/nginx.conf" ]; then
    echo "Nginx config file not found! Copying default config..."
    mkdir -p /etc/nginx
    cp ./nginx/nginx.conf /etc/nginx/nginx.conf
fi

# Start Nginx in the background
echo "Starting Nginx..."
nginx -c /etc/nginx/nginx.conf &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
