#!/bin/bash

echo "Starting Nginx from local build..."
./nginx_download/nginx-1.25.0/nginx_build/sbin/nginx -c $(pwd)/nginx/nginx.conf -p $(pwd)/nginx/

echo "Starting FastAPI..."
uvicorn main:app --host 0.0.0.0 --port 8000
