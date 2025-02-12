FROM nginx:latest

# Print installed packages (debugging)
RUN apt update && apt list --installed > /installed_packages.txt

# Remove default Nginx configs (if necessary)
RUN rm -rf /etc/nginx/conf.d/*

# Copy custom Nginx configuration
COPY nginx/nginx.conf /etc/nginx/nginx.conf

# Set permissions to prevent Render permission issues
RUN chmod -R 755 /etc/nginx/

# Expose the correct port for Render
EXPOSE 10000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
