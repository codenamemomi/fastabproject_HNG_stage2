# Use official Nginx as base image
FROM nginx:latest

# Copy custom Nginx configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/mime.types /etc/nginx/mime.types  

# Set permissions (Fix Render permissions issue)
RUN chmod -R 755 /etc/nginx/

# Expose the correct port for Render
EXPOSE 10000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
