
# Start Nginx
nginx -c /app/nginx/nginx.conf

# Start FastAPI
uvicorn app.main:app --host 0.0.0.0 --port 8000
