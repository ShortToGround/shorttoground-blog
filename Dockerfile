FROM nginx:latest

ARG path
ENV path=${path}

COPY $path/nginx/blog.conf /etc/nginx/nginx.conf
COPY $path/public /var/www/blog/public

# Restart nginx to load new config
RUN service nginx restart

# Networking Config
EXPOSE 8080