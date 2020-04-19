# Description: Dockerfile for mongodb database of dgsogp
FROM mongo:4.2-bionic
LABEL maintainer="wing <872559403@qq.com>" project="dgsogp_mongodb"

ENV MONGO_INITDB_ROOT_USERNAME="root" MONGO_INITDB_ROOT_PASSWORD="123456"
COPY dgsogp_mongodb.js /data/mongodb/
COPY docker-entrypoint.sh /usr/local/bin/
EXPOSE 27017
