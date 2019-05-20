FROM alpine:3.9

# Install fish
RUN apk update && apk add fish

# s6 overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.7.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Dependencies
RUN apk update && apk add curl git zip
RUN apk add --no-cache \
    nginx \
    php7 \
    php7-fpm \
    php7-curl \
    php7-dom \
    php7-exif \
    php7-fileinfo \
    php7-gd \
    php7-iconv \
    php7-intl \
    php7-json \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-pdo \
    php7-pdo_mysql \
    php7-redis \
    php7-session \
    php7-xml \
    php7-zip \
    php7-zlib \
    php7-imagick \
    php7-phar \
    php7-tokenizer \
    imagemagick && \
    mkdir -p /var/www/html/

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Script files
COPY rootfs /

# Services
RUN chmod 755 /etc/services.d/nginx/run && \
    chmod 755 /etc/services.d/nginx/finish && \
    chmod 755 /etc/services.d/php_fpm/run && \
    chmod 755 /etc/services.d/php_fpm/finish
COPY bootstrap.php /root/bootstrap.php

# Entrypoint
ENTRYPOINT ["/init"]
