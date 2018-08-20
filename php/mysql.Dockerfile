# Just to run old wordpress
# Set the base image
FROM php:5.6.37-apache-stretch
ADD mysql.supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN apt-get update && \
    apt-get install mysql-server supervisor -y && \
    mysql_install_db --user=mysql --rpm && \
    sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf && \
    (mysqld_safe &) && \
    sleep 2 && \
    mysql -u root -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION; " && \
    killall -TERM mysqld && \
    docker-php-ext-install mysql
# Expose default port
EXPOSE 80 3306
VOLUME /var/www/html /var/lib/mysql
ENTRYPOINT exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf