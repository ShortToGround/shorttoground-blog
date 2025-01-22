FROM nginx:latest

ARG path
ENV path=$PATH

COPY $PATH/nginx/nginx.conf /etc/nginx/nginx.conf
COPY public /var/www/blog/public

# Restart nginx to load new config
RUN service nginx restart

# Networking Config
EXPOSE 8080