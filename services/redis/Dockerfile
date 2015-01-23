FROM maxexcloo/debian:latest
MAINTAINER Marcin Kurzyna <marcin.kurzyna@nextwebventures.com>

RUN echo "deb http://http.debian.net/debian wheezy-backports main" > /etc/apt/sources.list.d/backports.list
RUN apt-get update
RUN apt-get install -y redis-server

RUN sed -i -e "s/^daemonize yes/daemonize no/" /etc/redis/redis.conf
RUN sed -i -e "s/^bind 127.0.0.1/bind 0.0.0.0/" /etc/redis/redis.conf
RUN sed -i -e "s/^logfile .*$/logfile stdout/" /etc/redis/redis.conf

ADD config /config
ADD etc /etc

ADD supervisord.conf /etc/supervisor/conf.d/redis.conf
EXPOSE 6379
