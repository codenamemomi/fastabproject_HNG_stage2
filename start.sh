#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Stopping any existing Nginx instances..."
nginx -s stop || echo "No running Nginx process found."

# Ensure nginx.conf exists
if [ ! -f "./nginx.conf" ]; then
    echo "❌ ERROR: nginx.conf not found!"
    exit 1
fi

echo "Ensuring /tmp/nginx.pid does not exist..."
rm -f /tmp/nginx.pid  # Remove old PID file if it exists

echo "Starting Nginx using local config..."
nginx -c $(pwd)/nginx.conf -g "daemon off;" &  # Use local nginx.conf instead of /etc/nginx/

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
