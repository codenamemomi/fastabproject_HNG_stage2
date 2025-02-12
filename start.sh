#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Stopping any existing Nginx instances..."
nginx -s stop || echo "No running Nginx process found."

echo "Removing default Nginx config..."
rm -f /etc/nginx/nginx.conf  # Remove the default config
cp nginx.conf /etc/nginx/nginx.conf  # Use our custom config

echo "Ensuring /tmp/nginx.pid does not exist..."
rm -f /tmp/nginx.pid  # Delete old PID file if it exists

echo "Starting Nginx..."
nginx -g "pid /tmp/nginx.pid; daemon off;" &  # Explicitly set the PID file

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
