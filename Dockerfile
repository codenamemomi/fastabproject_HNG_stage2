FROM python:3.11-slim AS base

# Install system dependencies
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy application files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

# Expose necessary ports
EXPOSE 80

# Start Nginx and FastAPI
CMD ["/bin/bash", "-c", "nginx -g 'daemon off;' & uvicorn main:app --host 0.0.0.0 --port 8000"]
