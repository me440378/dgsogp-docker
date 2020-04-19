#!/bin/bash
echo 'checking nginx status.'
service nginx status

echo '1.start nginx....'
service nginx start
sleep 3
service nginx status

cd /data/dgsogp/dgsogp_django
echo '2.collecting static resource....'
python3 manage.py collectstatic
sleep 3

echo '3.start gunicorn....'
exec gunicorn -c ./gunicorn.py dgsogp_django.wsgi:application
