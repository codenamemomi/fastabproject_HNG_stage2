#!/bin/bash

# Print current working directory
echo "Current working directory:"
pwd

# Ensure /tmp directory exists
mkdir -p /tmp

# Create log files if they don't exist and set correct permissions
touch /tmp/nginx_access.log /tmp/nginx_error.log
chmod 666 /tmp/nginx_access.log /tmp/nginx_error.log

# Ensure Nginx uses the correct config file
echo "Starting Nginx with custom config..."
nginx -c "$(pwd)/nginx/nginx.conf" &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
