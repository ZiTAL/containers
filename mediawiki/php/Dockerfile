FROM docker.io/library/php:8.2-fpm-alpine
RUN set -ex; apk update && apk --no-cache add file libmemcached-dev zlib-dev libpng libpng-dev libjpeg libjpeg-turbo-dev freetype freetype-dev libzip-dev autoconf g++ make icu-dev icu-libs libtool imagemagick diffutils git
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd intl
RUN pecl install apcu memcached && docker-php-ext-enable apcu memcached
WORKDIR /app
