#!/bin/bash
echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000 &  # Run FastAPI in the background

# Wait for FastAPI to become available
while ! curl -s http://127.0.0.1:8000/healthcheck; do
  echo "Waiting for FastAPI to start..."
  sleep 2
done

echo "Starting Nginx..."
nginx -g "daemon off;"
