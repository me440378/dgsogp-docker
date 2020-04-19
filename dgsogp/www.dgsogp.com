server {
        # 指定本项目监听端口,浏览器输入端口
        listen 80;
        # 域名
        server_name www.dgsogp.com;
        # 指定字符集
        charset utf-8;

        access_log /data/nginx/logs/dgsogp_django.access.log;
        error_log /data/nginx/logs/dgsogp_django.error.log;
        client_max_body_size 75M;

        # 指定收集静态文件路径
        location /static {
                alias /data/dgsogp/dgsogp_django/static;
        }

        location / {
                # gunicorn配置
                proxy_pass http://127.0.0.1:8888;
        }
        # 处理websocket请求
        location /api/1.0/databaseinterfaces/dbcli {
                # gunicorn配置
                proxy_pass http://127.0.0.1:8888;
                proxy_http_version 1.1;
                proxy_redirect off;
                proxy_set_header Host $host;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
                # 下面两行是重点
                proxy_set_header Upgrade $http_upgrade;
                proxy_set_header Connection "upgrade";
        }

}
