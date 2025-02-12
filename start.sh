
# Start Nginx
nginx -c ./nginx/nginx.conf

# Start FastAPI
uvicorn main:app --host 0.0.0.0 --port 8000
