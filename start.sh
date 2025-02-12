#!/bin/bash

# Print current working directory
echo "Current working directory:"
pwd

# Ensure required directories exist
sudo mkdir -p /run /tmp /var/run/nginx
sudo chmod 755 /run /var/run/nginx

# Fix ownership to avoid permission issues
sudo chown $(whoami) /run/nginx.pid /var/run/nginx

sudo touch /tmp/nginx_access.log /tmp/nginx_error.log
sudo chmod 666 /tmp/nginx_access.log /tmp/nginx_error.log

echo "Stopping any existing Nginx instances..."
sudo nginx -s stop || true  

echo "Removing default Nginx configs..."
sudo rm -f /etc/nginx/nginx.conf /etc/nginx/sites-enabled/default

echo "Applying custom Nginx configuration..."
sudo cp "$(pwd)/nginx/nginx.conf" /etc/nginx/nginx.conf

echo "Starting Nginx..."
sudo nginx -c /etc/nginx/nginx.conf -p /var/run/nginx/ -g "pid /run/nginx.pid; daemon off;" &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting
