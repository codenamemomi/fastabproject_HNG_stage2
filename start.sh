#!/bin/bash

echo "Current working directory:"
pwd

# Ensure required directories exist
mkdir -p /run /tmp /var/run/nginx
chmod 755 /run /var/run/nginx

# Create the Nginx PID file if it doesn't exist
if [ ! -f "/run/nginx.pid" ]; then
    echo "Creating /run/nginx.pid..."
    touch /run/nginx.pid
fi

# Make sure PID file is not empty before using it
echo "Ensuring Nginx PID file is valid..."
echo "12345" > /run/nginx.pid  # Dummy value, Nginx will overwrite this

# Stop any running Nginx instances
echo "Stopping any existing Nginx instances..."
nginx -s stop || true  

# Remove default config files
echo "Removing default Nginx configs..."
rm -f /etc/nginx/nginx.conf /etc/nginx/sites-enabled/default

# Apply custom Nginx config
echo "Applying custom Nginx configuration..."
cp "$(pwd)/nginx/nginx.conf" /etc/nginx/nginx.conf

# Start Nginx with explicit PID file location
echo "Starting Nginx..."
nginx -c /etc/nginx/nginx.conf -g "pid /run/nginx.pid; daemon off;" &

# Wait for Nginx to start
sleep 2

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
