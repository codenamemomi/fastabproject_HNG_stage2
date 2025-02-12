#!/bin/bash

# Print current working directory
echo "Current working directory:"
pwd

# Ensure required directories exist
sudo mkdir -p /run /tmp

# Fix permissions for /run
sudo chmod 755 /run

# Create log files and set correct permissions
sudo touch /tmp/nginx_access.log /tmp/nginx_error.log
sudo chmod 666 /tmp/nginx_access.log /tmp/nginx_error.log

# Stop any running Nginx instances (ignores errors if none are running)
echo "Stopping any existing Nginx instances..."
sudo nginx -s stop || true  

# Manually remove default config files
echo "Removing default Nginx configs..."
sudo rm -f /etc/nginx/nginx.conf /etc/nginx/sites-enabled/default

# Copy and enforce custom Nginx config
echo "Applying custom Nginx configuration..."
sudo cp "$(pwd)/nginx/nginx.conf" /etc/nginx/nginx.conf

# Start Nginx with custom config
echo "Starting Nginx..."
sudo nginx -c /etc/nginx/nginx.conf -g "daemon off;" &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
