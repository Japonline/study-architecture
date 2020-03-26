# docker/php-fpm/Dockerfile
FROM php:7.4.1-fpm-alpine3.10

ENV DEBIAN_FRONTEND noninteractive

RUN apk upgrade --update && apk --no-cache add git libzip-dev zip unzip autoconf gcc g++ make supervisor
RUN docker-php-ext-install zip pdo_mysql

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer
RUN composer global require hirak/prestissimo

COPY . /var/www

WORKDIR /var/www

CMD ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisor/conf.d/laravel-worker.conf"]
