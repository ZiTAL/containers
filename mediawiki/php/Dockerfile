FROM docker.io/library/php:8.2-fpm-alpine
RUN set -ex; apk --no-cache add libmemcached-dev zlib-dev libpng-dev libjpeg-turbo-dev freetype-dev libzip-dev autoconf g++ make
RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd
RUN pecl install apcu memcached && docker-php-ext-enable apcu memcached
