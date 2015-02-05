FROM maxexcloo/debian:latest
MAINTAINER Marcin Kurzyna <marcin.kurzyna@nextwebventures.com>

RUN usermod -u 1000 core && groupmod -g 1000 core && usermod -g 1000 core

# add sources
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ABF5BD827BD9BF62
RUN echo "deb http://www.nginx.org/packages/mainline/debian/ wheezy nginx" > /etc/apt/sources.list.d/nginx.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E
RUN echo "deb http://packages.dotdeb.org/ wheezy-php56 all" > /etc/apt/sources.list.d/php.list

RUN apt-get update

# isntall generic
RUN apt-get install -y curl htop vim net-tools mc bash-completion procps iputils-ping git

# install PHP
RUN apt-get install -y nginx
RUN rm -rf /etc/nginx/*.d
RUN mkdir -p /etc/nginx/addon.d /etc/nginx/conf.d /etc/nginx/host.d /etc/nginx/nginx.d

# install PHP
RUN apt-get install -y php5-cli php5-curl php5-fpm php5-gd php5-mcrypt php5-pgsql php5-sqlite
RUN curl -sS https://getcomposer.org/installer | php  -- --install-dir=/bin
RUN rm -rf /etc/nginx/addon.d /etc/php5/fpm/pool.d
RUN mkdir -p /etc/nginx/addon.d /etc/php5/fpm/pool.d

ADD config /config
ADD etc /etc
ADD supervisord.conf /etc/supervisor/conf.d/nginx-php-fpm.conf

# add precompiled module
ADD build/redis.so /usr/lib/php5/20131226-zts/redis.so
RUN php5enmod redis

EXPOSE 80
