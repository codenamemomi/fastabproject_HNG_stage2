#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Stopping any existing Nginx instances..."
nginx -s stop || echo "No running Nginx process found."

# Ensure nginx.conf exists before proceeding
if [ ! -f "./nginx.conf" ]; then
    echo "❌ ERROR: nginx.conf not found!"
    exit 1
fi

echo "Ensuring /tmp/nginx.pid does not exist..."
rm -f /tmp/nginx.pid  # Remove old PID file if it exists

echo "Starting Nginx..."
nginx -c $(pwd)/nginx.conf -g "pid /tmp/nginx.pid; daemon off;" &  # Force correct PID path

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
