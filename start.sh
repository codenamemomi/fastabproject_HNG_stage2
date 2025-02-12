
# Print current working directory
echo "Current working directory:"
pwd

# Start Nginx
nginx -c /home/runner/work/fastabproject_HNG_stage2/fastabproject_HNG_stage2/nginx/nginx.conf

# Start FastAPI
uvicorn main:app --host 0.0.0.0 --port 8000
