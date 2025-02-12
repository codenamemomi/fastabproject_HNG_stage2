#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Starting Nginx..."
nginx -c $(pwd)/nginx.conf -g "daemon off;" &  # Start Nginx in the background

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
