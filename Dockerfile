FROM nginx:latest

COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/mime.types /etc/nginx/mime.types 

CMD ["nginx", "-g", "daemon off;"]
