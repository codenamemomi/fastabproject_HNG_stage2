#!/bin/bash

# Print current working directory
echo "Current working directory:"
pwd

# Ensure /tmp directory exists
mkdir -p /tmp

# Ensure nginx.conf is properly placed
echo "Copying custom Nginx configuration..."
sudo cp ./nginx/nginx.conf /etc/nginx/nginx.conf

# Ensure log files can be written
touch /tmp/nginx_access.log /tmp/nginx_error.log
chmod 666 /tmp/nginx_access.log /tmp/nginx_error.log

# Start Nginx in the background with the correct config
echo "Starting Nginx..."
nginx -c /etc/nginx/nginx.conf &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
