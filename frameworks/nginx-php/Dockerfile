FROM maxexcloo/debian:latest
MAINTAINER Marcin Kurzyna <marcin.kurzyna@nextwebventures.com>

RUN usermod -u 1000 core && groupmod -g 1000 core && usermod -g 1000 core

# add sources
ADD etc/apt /etc/apt
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E

RUN apt-get update

# isntall generic
RUN apt-get install -y curl htop vim net-tools mc bash-completion procps iputils-ping git apt-utils dnsmasq

# install nginx
RUN apt-get -t testing install -y nginx-extras
RUN rm -rf /etc/nginx/*.d
RUN mkdir -p /etc/nginx/addon.d /etc/nginx/conf.d /etc/nginx/host.d /etc/nginx/nginx.d

# install PHP
RUN apt-get install -y php5-cli php5-curl php5-fpm php5-gd php5-mcrypt php5-pgsql php5-sqlite php5-redis
RUN curl -sS https://getcomposer.org/installer | php  -- --install-dir=/bin
RUN rm -rf /etc/nginx/addon.d /etc/php5/fpm/pool.d
RUN mkdir -p /etc/nginx/addon.d /etc/php5/fpm/pool.d

ADD config /config
ADD etc /etc
ADD supervisord.conf /etc/supervisor/conf.d/nginx-php-fpm.conf

EXPOSE 80
