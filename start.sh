#!/bin/bash

# Print current working directory
echo "Current working directory:"
pwd

# Ensure required directories exist
sudo mkdir -p /run /tmp /var/run/nginx
sudo chmod 755 /run /var/run/nginx

# Fix ownership to avoid permission issues
sudo chown $(whoami) /run/nginx.pid /var/run/nginx

# Create log files and set correct permissions
sudo touch /tmp/nginx_access.log /tmp/nginx_error.log
sudo chmod 666 /tmp/nginx_access.log /tmp/nginx_error.log

# Stop any running Nginx instances
echo "Stopping any existing Nginx instances..."
sudo nginx -s stop || true  

# Manually remove default config files
echo "Removing default Nginx configs..."
sudo rm -f /etc/nginx/nginx.conf /etc/nginx/sites-enabled/default

# Copy and enforce custom Nginx config
echo "Applying custom Nginx configuration..."
sudo cp "$(pwd)/nginx/nginx.conf" /etc/nginx/nginx.conf

# Start Nginx with explicit PID file location
echo "Starting Nginx..."
sudo nginx -c /etc/nginx/nginx.conf -p /var/run/nginx/ -g "pid /run/nginx.pid; daemon off;" &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting
