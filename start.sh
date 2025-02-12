
# Print current working directory
echo "Current working directory:"
pwd

# Create tmp directory if it doesn't exist
mkdir -p /home/runner/work/fastabproject_HNG_stage2/tmp

# Start Nginx
nginx -c ./nginx/nginx.conf

# Start FastAPI
uvicorn main:app --host 0.0.0.0 --port 8000
