#!/bin/bash

echo "Current working directory:"
pwd

# Ensure /tmp exists for logs
mkdir -p /tmp/nginx_logs

# Kill any existing Nginx processes
echo "Stopping any existing Nginx instances..."
pkill nginx || echo "No running Nginx process found."

# Start a local Nginx instance
echo "Starting Nginx..."
nginx -c $(pwd)/nginx/nginx.conf -p $(pwd)/nginx/

# Start FastAPI
echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
