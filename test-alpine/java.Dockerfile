# java, mysql, redis, supervisor

# Set the base image
FROM java:8u111-jdk-alpine

LABEL Description="alias can only be used in interactive sh -l"
COPY root/* /root/
ADD java.supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN set -ex && \
    apk upgrade --update && \
    apk add --update curl mariadb mariadb-client supervisor redis && \
    mysql_install_db --user=mysql --rpm && \
    (mysqld_safe &) && \
    sleep 2 && \
    mysql -u root -e "GRANT ALL ON root.* TO 'root'@'%' IDENTIFIED BY '123456'; " && \
    killall -TERM mysqld
# RUN apk add --update git

EXPOSE 3306 6379
ENTRYPOINT exec /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf