# Description: Dockerfile for mysql database of dgsogp
FROM mysql:5.7
LABEL maintainer="wing <872559403@qq.com>" project="dgsogp_mysql"

ENV MYSQL_ROOT_PASSWORD=123456
COPY dgsogp_mysql.sql setup.sh /data/mysql/
EXPOSE 3306
CMD ["sh", "/data/mysql/setup.sh"]
