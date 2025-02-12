FROM nginx:latest

RUN apt update && apt list --installed > /installed_packages.txt

RUN rm -rf /etc/nginx/conf.d/*

COPY nginx/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /etc/nginx/

EXPOSE 10000

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
