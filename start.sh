#!/bin/bash

# Print current working directory
echo "Current working directory:"
pwd

# Ensure /tmp directory exists
mkdir -p /tmp

# Create log files and set correct permissions
touch /tmp/nginx_access.log /tmp/nginx_error.log
chmod 666 /tmp/nginx_access.log /tmp/nginx_error.log

# Stop any running Nginx processes
echo "Stopping any existing Nginx instances..."
sudo nginx -s stop || true  # Ignore errors if Nginx isn't running

# Manually remove default config files (IMPORTANT)
echo "Removing default Nginx configs..."
sudo rm -f /etc/nginx/nginx.conf /etc/nginx/sites-enabled/default

# Copy and force usage of your custom Nginx config
echo "Applying custom Nginx configuration..."
sudo cp "$(pwd)/nginx/nginx.conf" /etc/nginx/nginx.conf

# Start Nginx with your custom config
echo "Starting Nginx..."
sudo nginx -c /etc/nginx/nginx.conf -g "daemon off;" &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
