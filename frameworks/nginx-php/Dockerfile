FROM maxexcloo/nginx:latest
MAINTAINER Max Schaefer <max@excloo.com>
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E
RUN echo "deb http://packages.dotdeb.org/ wheezy-php56 all" > /etc/apt/sources.list.d/php.list
RUN apt-get update
RUN apt-get install -y php5-cli php5-curl php5-fpm php5-gd php5-mcrypt php5-pgsql php5-sqlite php5-redis
RUN apt-get install -y curl htop vim net-tools mc bash-completion procps iputils-ping
RUN rm -rf /etc/nginx/addon.d /etc/php5/fpm/pool.d
RUN mkdir -p /etc/nginx/addon.d /etc/php5/fpm/pool.d
ADD etc /etc
ADD supervisord.conf /etc/supervisor/conf.d/php-fpm.conf
