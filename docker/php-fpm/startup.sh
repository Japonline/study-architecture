#!/bin/sh

# migrate lunch
php artisan cache:clear

php artisan migrate:fresh --seed
# php artisan migrate

# start worker
# php artisan queue:work

# php-fpm sever lunch
php-fpm
