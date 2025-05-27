FROM php:8.4.7-fpm-alpine3.20

RUN apk add --no-cache \
    libmemcached-dev \
    zlib-dev \
    icu-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libxpm-dev \
    freetype-dev \
    oniguruma-dev \
    mariadb-client \
    autoconf \
    g++ \
    make \
    bash \
    git \
    unzip \
    curl \
    && docker-php-ext-install mysqli pdo pdo_mysql intl opcache \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    # Clean up build deps to reduce image size (optional)
    && apk del autoconf g++ make
