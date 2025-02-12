#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Starting Nginx..."
nginx -c $(pwd)/nginx/nginx.conf -g "daemon off;" &


echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
