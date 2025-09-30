# Use an official base image
FROM nginx:stable-alpine

# Copiar archivos index y styles
COPY index.html /usr/share/nginx/html/index.html
COPY style.css /usr/share/nginx/html/style.css

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
