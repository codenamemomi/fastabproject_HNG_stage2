#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Stopping any existing Nginx instances..."
nginx -s stop || echo "No running Nginx process found."

echo "Starting Nginx..."
nginx -g "daemon off;" &  # Run Nginx in the background

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
