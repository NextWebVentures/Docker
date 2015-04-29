FROM maxexcloo/debian:latest
MAINTAINER Marcin Kurzyna <marcin.kurzyna@nextwebventures.com>

RUN usermod -u 1000 core && groupmod -g 1000 core && usermod -g 1000 core && usermod -aG www-data,adm core

# add sources
ADD etc/apt /etc/apt
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E

RUN sed -i -e 's/http.debian.net/httpredir.debian.org/' /etc/apt/sources.list
RUN apt-get clean && apt-get update

# isntall generic
RUN apt-get install -y --no-install-recommends curl htop vim net-tools mc bash-completion procps iputils-ping git apt-utils dnsmasq locales

RUN echo "pl_PL.UTF-8 UTF-8" >> /etc/locale.gen && \
    echo "Europe/Warsaw" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata && \
    locale-gen --purge

# install nginx
RUN apt-get -t testing install -y --no-install-recommends nginx-extras
RUN rm -rf /etc/nginx/*.d
RUN mkdir -p /etc/nginx/addon.d /etc/nginx/conf.d /etc/nginx/host.d /etc/nginx/nginx.d

# install PHP
RUN apt-get install --no-install-recommends -y php5-cli php5-curl php5-fpm php5-gd php5-mcrypt php5-pgsql php5-sqlite php5-redis
RUN curl -sS https://getcomposer.org/installer | php  -- --install-dir=/bin
RUN rm -rf /etc/nginx/addon.d /etc/php5/fpm/pool.d
RUN mkdir -p /etc/nginx/addon.d /etc/php5/fpm/pool.d

ADD config /config
ADD etc /etc
ADD supervisord.conf /etc/supervisor/conf.d/nginx-php-fpm.conf

EXPOSE 80
