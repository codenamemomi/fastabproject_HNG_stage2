#!/bin/bash

echo "Current working directory:"
pwd

# Ensure /tmp exists for logs
mkdir -p /tmp

# Stop any existing Nginx processes
echo "Stopping any existing Nginx instances..."
nginx -s stop || echo "No running Nginx process found."

# Remove default Nginx configs
echo "Removing default Nginx configs..."
rm -f /etc/nginx/nginx.conf
rm -f /etc/nginx/sites-enabled/default

# Apply custom Nginx configuration
echo "Applying custom Nginx configuration..."
cp ./nginx/nginx.conf /etc/nginx/nginx.conf

# Start Nginx
echo "Starting Nginx..."
nginx

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
