# docker/php-fpm/Dockerfile
FROM php:7.4.1-fpm-alpine3.10

ENV DEBIAN_FRONTEND noninteractive

RUN apk upgrade --update && apk --no-cache add git libzip-dev zip unzip autoconf gcc g++ make \
    freetype-dev libjpeg-turbo-dev libpng-dev
RUN docker-php-ext-install zip pdo_mysql gd

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN composer global require hirak/prestissimo

# node.js install
RUN curl -sL https://deb.nodesource.com/setup_13.x | php -- --install-dir=/usr/bin
RUN apk add --update nodejs nodejs-npm

# RUN { \
#     echo 'upload_max_filesize = 100M'; \
#     echo 'post_max_size = 108M'; \
#     echo 'short_open_tag = On'; \
#     echo 'fastcgi.logging = 1'; \
#     echo 'opcache.enable=1'; \
#     echo 'opcache.optimization_level=0x7FFFBBFF'; \
#     echo 'opcache.revalidate_freq=0'; \
#     echo 'opcache.validate_timestamps=1'; \
#     echo 'opcache.memory_consumption=128'; \
#     echo 'opcache.interned_strings_buffer=8'; \
#     echo 'opcache.max_accelerated_files=4000'; \
#     echo 'opcache.revalidate_freq=60'; \
#     echo 'opcache.fast_shutdown=1'; \
#     echo 'xdebug.remote_enable=1'; \
# } > /usr/local/etc/php/conf.d/overrides.ini

# RUN mkdir -p /app
COPY . /var/www
# COPY .env.development /var/www/.env

WORKDIR /var/www

# RUN composer install
# RUN cp .env.example .env
# RUN cp .env .env
# RUN php artisan key:generate
# RUN chmod -R a+w storage/ bootstrap/cache
