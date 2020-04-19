#!/bin/bash

echo 'checking mysql status.'
service mysql status

echo '1.start mysql....'
service mysql start
sleep 3
service mysql status

echo '2.start importing data....'
mysql -uroot -p${MYSQL_ROOT_PASSWORD} < /data/mysql/dgsogp_mysql.sql
echo '3.end importing data....'

sleep 3
service mysql status

echo '4.start setting login from remote....'
mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}'"
echo '5.end setting login from remote....'

sleep 3
service mysql status
echo 'mysql is ready'

tail -f /dev/null
