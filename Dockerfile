FROM nginx:latest

WORKDIR "/tmp"
RUN mkdir -p nginx

# Dependencies
# Going to add hugo versions as env variables later
RUN apt-get update -y && apt-get -y install git wget

RUN wget "https://github.com/gohugoio/hugo/releases/download/v0.117.0/hugo_extended_0.117.0_linux-amd64.tar.gz"
RUN tar xzvf hugo*

# Gather blog data
RUN git clone https://github.com/ShortToGround/shorttoground-blog.git

# Generate static web data and move it to nginx dirs
WORKDIR "/tmp/shorttoground-blog"
RUN /tmp/hugo
RUN mkdir -p /var/www/blog
## running /bin/cp directly in case cp is actually aliased as 'cp -i'
RUN /bin/cp -r public /var/www/blog/public
RUN /bin/cp /tmp/shorttoground-blog/nginx/blog.conf /etc/nginx/nginx.conf

# Restart nginx to load new config
RUN service nginx restart

# Networking Config
EXPOSE 80