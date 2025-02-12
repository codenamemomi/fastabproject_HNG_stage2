#!/bin/bash

echo "Starting the application..."
echo "Current working directory: $(pwd)"

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
