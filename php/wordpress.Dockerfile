# Just to run old wordpress
# The docker container contains PHP 5.6, MYSQL, APACHE. 
# When run the container every time, the start script will execute a SQL script file located at /var/sql/wordpress.sql which can be mounted externally. 

# Set the base image
FROM php:5.6.37-apache-stretch
ADD wordpress.sh /var/
ADD mysql.supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN apt-get update && \
    apt-get install mysql-server supervisor -y && \
    mysql_install_db --user=mysql --rpm && \
    sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf && \
    (mysqld_safe &) && \
    sleep 2 && \
    mysql -u root -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION; " && \
    mysql -u root -e "GRANT ALL ON *.* TO 'root'@'localhost' IDENTIFIED BY '123456' WITH GRANT OPTION; " && \
    killall -TERM mysqld && \
    docker-php-ext-install mysql && \
    chmod 777 /var/wordpress.sh
# RUN mkdir /var/sql && cd /var/sql && \
#     mysql -u root -e "CREATE SCHEMA IF NOT EXISTS `wordpress` DEFAULT CHARACTER SET utf8; set names utf8; use wordpress; source wordpress.sql;"
# Expose default port
EXPOSE 80 3306
VOLUME /var/www/html /var/sql
ENTRYPOINT ["sh", "/var/wordpress.sh"]