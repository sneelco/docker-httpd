#!/usr/bin/bash

if [ ! -f /etc/httpd/conf/localhost.key.pem ]; then
echo "




localhost.localdomain

" |openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/httpd/conf/localhost.key.pem -out /etc/httpd/conf/localhost.cert.pem
fi

/usr/sbin/httpd -DFOREGROUND
