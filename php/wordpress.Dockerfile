# Just to run old wordpress
# Set the base image
FROM php:5.6.37-apache-stretch
RUN docker-php-ext-install mysql
# Expose default port
EXPOSE 80
VOLUME /var/www/html