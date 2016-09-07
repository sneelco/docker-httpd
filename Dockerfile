FROM fedora:latest

RUN dnf clean all && \
  dnf update -y && \
  dnf install httpd mod_ssl mod_security -y

RUN rm -f \
  /etc/httpd/conf.d/* \
  /etc/httpd/conf.modules.d/00-dav.conf \
  /etc/httpd/conf.modules.d/01-cgi.conf \
  /etc/httpd/conf.modules.d/00-lua.conf


COPY httpd.conf /etc/httpd/conf
COPY 01-default.conf /etc/httpd/conf.d
COPY index.html /var/www/html
COPY start.sh /usr/local/bin

EXPOSE 80 443

CMD /usr/local/bin/start.sh
