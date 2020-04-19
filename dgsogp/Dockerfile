# Description : Dockerfile of dgsogp
# with django project and gunicorn and nginx
FROM ubuntu:bionic
LABEL maintainer="wing <872559403@qq.com>" project="dgsogp"

COPY sources.list /etc/apt/
COPY dgsogp_requirements.txt get-pip.py setup.sh /data/venv/
#dgsogp项目代码用git clone下载就好
COPY dgsogp /data/dgsogp
EXPOSE 8888
EXPOSE 80
RUN apt update && \
    apt upgrade -y && \
    apt install -y net-tools iproute2 iputils-ping && \
    # Install python3
    apt install -y python3 python3-distutils && \
    # Install pip
    apt install -y wget vim && \
    python3 /data/venv/get-pip.py && \
    pip config set global.index-url http://mirrors.aliyun.com/pypi/simple && \
    pip config set install.trusted-host mirrors.aliyun.com && \
    pip install --upgrade pip && \
    # Install dgsogp python requirements
    export LANG=C.UTF-8 && \
    pip install -r /data/venv/dgsogp_requirements.txt && \
    mkdir -p /data/dgsogp/dgsogp_django/logs && \
    mkdir -p /data/gunicorn/logs && \
    # Install dgsogp frontend requirements
    apt install -y npm && \
    npm install -g cnpm && \
    cd /data/dgsogp/dgsogp_django/frontend && \
    cnpm install && \
    cnpm run build && \
    # Install ssh
    apt install -y ssh && \
    # Install Nginx
    apt install -y nginx && \
    mkdir -p /data/nginx/logs
COPY www.dgsogp.com /etc/nginx/sites-enabled/ 
CMD ["sh", "/data/venv/setup.sh"]
