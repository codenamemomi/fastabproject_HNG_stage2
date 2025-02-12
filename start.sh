#!/bin/bash

# Print current working directory
echo "Current working directory:"
pwd

# Ensure /tmp directory exists
mkdir -p /tmp

# Create log files and set correct permissions
touch /tmp/nginx_access.log /tmp/nginx_error.log
chmod 666 /tmp/nginx_access.log /tmp/nginx_error.log

# Stop any existing Nginx instances
echo "Stopping any existing Nginx instances..."
sudo nginx -s stop || true  # Ignore errors if Nginx isn't running

# Start Nginx with the correct config
echo "Starting Nginx with custom config..."
nginx -c "$(pwd)/nginx/nginx.conf" -g "daemon off;" &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
