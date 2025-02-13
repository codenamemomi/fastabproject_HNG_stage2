#!/bin/bash

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000 &  

# Wait for FastAPI to become available
while ! curl -s http://127.0.0.1:8000/healthcheck; do
  echo "Waiting for FastAPI to start..."
  sleep 2
done

echo "Starting Nginx..."