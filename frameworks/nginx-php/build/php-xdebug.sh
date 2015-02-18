#!/bin/bash -x

[ -f /data/xdebug.so ] && exit 0;

export XDEBUG_VRSION="2.2.7"
export DEBIAN_FRONTEND="noninteractive"

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E
echo "deb http://packages.dotdeb.org/ wheezy-php56 all" > /etc/apt/sources.list.d/php.list

apt-get update
apt-get install -y php5-dev curl php-pear make

pecl install xdebug && cp /usr/lib/php5/20131226/xdebug.so /data/xdebug.so
