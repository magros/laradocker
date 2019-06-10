FROM ubuntu:latest
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install composer php7.2 php7.2-common php7.2-cli php7.2-fpm php7.2-curl php7.2-memcached \
    php7.2-mysql php7.2-xml php7.2-mbstring php7.2-dom php7.2-gd php7.2-zip php7.2-sqlite3 php7.2-bcmath \
    sqlite3 nginx libfontconfig1 libxrender1 libxext6 nano gettext-base libssl1.0-dev \
    -y --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*
WORKDIR /var/www/html
COPY nginx/vhost.conf /etc/nginx/sites-available/default
COPY start.sh /usr/local/bin/start
RUN chown -R www-data:www-data /var/www/html
COPY . /var/www/html
RUN chmod +x /usr/local/bin/start
CMD ["/usr/local/bin/start"]
