#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Stopping any existing Nginx instances..."
nginx -s stop || echo "No running Nginx process found."

# Ensure nginx.conf exists before proceeding
if [ ! -f "./nginx/nginx.conf" ]; then
    echo "❌ ERROR: nginx.conf not found in nginx/ folder!"
    exit 1
fi

echo "Ensuring /tmp/nginx.pid does not exist..."
rm -f /tmp/nginx.pid  # Remove old PID file if it exists

echo "Copying nginx.conf to /etc/nginx/ (if allowed)..."
cp ./nginx/nginx.conf /etc/nginx/nginx.conf || echo "Skipping copy, no permission."

echo "Starting Nginx..."
nginx -c $(pwd)/nginx/nginx.conf -g "daemon off;" &  # Use correct path

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
