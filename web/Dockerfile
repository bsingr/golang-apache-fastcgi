FROM ubuntu:14.04
MAINTAINER Jens Bissinger <mail@jens-bissinger.de>

RUN apt-get update && apt-get -y install apache2 libapache2-mod-fcgid && apt-get clean
RUN a2enmod rewrite fcgid

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

RUN rm -rf /etc/apache2/sites-enabled
ADD ./sites-enabled /etc/apache2/sites-enabled

RUN rm -rf /var/www
ADD ./public /var/www

EXPOSE 80
EXPOSE 81
EXPOSE 82

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
