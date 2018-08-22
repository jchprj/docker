#!/bin/sh
/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf &
sleep 10
mkdir -p /var/sql
cd /var/sql
echo wordpress.sql import started
mysql -uroot -p123456 -e "CREATE SCHEMA IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8; set names utf8; use wordpress; source wordpress.sql;"
echo wordpress.sql import finished
bash