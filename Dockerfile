FROM alpine:latest
WORKDIR "/tmp"
RUN mkdir -p nginx
# Dependencies
RUN apk update && apk upgrade && apt add nginx 
RUN adduser -D -g 'www' www
RUN mkdir -p /var/www/blog/public && chown -R www:www /var/www/blog/public


COPY $path/nginx/blog.conf /etc/nginx/nginx.conf
COPY $path/public /var/www/blog/public

RUN rc-service nginx restart
# Networking Config
EXPOSE 8080