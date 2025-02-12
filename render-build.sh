#!/bin/bash

echo "Installing dependencies..."
pip install -r requirements.txt  # Ensure Uvicorn is installed

echo "Making start.sh executable..."
chmod +x start.sh

echo "Running start.sh..."
./start.sh
