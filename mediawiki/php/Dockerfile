FROM docker.io/library/php:8.2-fpm-alpine3.20

RUN set -ex; apk update && apk --no-cache add file libmemcached-dev zlib-dev libpng libpng-dev libjpeg libjpeg-turbo-dev freetype freetype-dev libzip-dev autoconf g++ make icu-dev icu-libs libtool imagemagick diffutils git

RUN docker-php-ext-install mysqli pdo pdo_mysql zip gd intl
RUN pecl install apcu memcached && docker-php-ext-enable apcu memcached

RUN sed -i 's/user = www-data/user = root/g' /usr/local/etc/php-fpm.d/www.conf
RUN sed -i 's/group = www-data/group = root/g' /usr/local/etc/php-fpm.d/www.conf

WORKDIR /app

CMD ["php-fpm", "--nodaemonize", "--force-stderr", "-R"]
