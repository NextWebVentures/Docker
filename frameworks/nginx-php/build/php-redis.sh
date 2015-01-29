#!/bin/bash -x

[ -f /data/redis.so ] && exit 0;

export PHPREDIS_VRSION="2.2.7"
export DEBIAN_FRONTEND="noninteractive"

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E
echo "deb http://packages.dotdeb.org/ wheezy-php56 all" > /etc/apt/sources.list.d/php.list

apt-get update
apt-get install -y php5-dev curl

curl -sLf https://github.com/phpredis/phpredis/archive/$PHPREDIS_VRSION.tar.gz | tar -xzf -
cd phpredis-$PHPREDIS_VRSION
phpize && ./configure && make && cp modules/redis.so /data/redis.so
