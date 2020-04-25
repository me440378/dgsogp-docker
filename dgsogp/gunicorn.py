#gunicorn.py
import logging
import logging.handlers
from logging.handlers import WatchedFileHandler
import os
import multiprocessing

bind = '127.0.0.1:8888'  # 绑定ip和端口号
backlog = 512  # 监听队列
chdir = '/data/dgsogp/dgsogp_django'  # gunicorn要切换到的目的工作目录
worker_class = 'gevent'  # 使用gevent模式，还可以使用sync 模式，默认的是sync模式
#workers = multiprocessing.cpu_count() * 2 + 1  # 进程数(多进程数据不互通，默认workers为1，单进程模式)
loglevel = 'info'  # 日志级别，这个日志级别指的是错误日志的级别，而访问日志的级别无法设置
errorlog = '/data/gunicorn/logs/gunicorn.error.log'  #错误日志
accesslog = '/data/gunicorn/logs/gunicorn.access.log' #访问日志
