#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Stopping any existing Nginx instances..."
nginx -s stop || echo "No running Nginx process found."

echo "Ensuring /tmp/nginx.pid does not exist..."
rm -f /tmp/nginx.pid  # Remove old PID file if it exists

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
