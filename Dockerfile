FROM alpine:latest

WORKDIR "/tmp"

# Install dependencies
RUN apk update && apk upgrade && apk add --no-cache nginx

# Create necessary directories
RUN adduser -D -g 'www' www && \
    mkdir -p /var/www/blog/public && \
    chown -R www:www /var/www/blog/public && \
    mkdir -p /run/nginx  
    # mkdir -p /run/nginx is a fix for missing nginx.pid issue 

# Copy configuration and content
COPY nginx/blog.conf /etc/nginx/nginx.conf
COPY public /var/www/blog/public

# Expose port 8080
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]