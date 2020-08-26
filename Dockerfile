FROM php:5.6-apache
RUN apt-get update && apt-get install -y \
        libfreetype6-dev libjpeg62-turbo-dev libpng-dev libicu-dev libmemcached-dev libbz2-dev libssl-dev librabbitmq-dev libxml2-dev libxslt1.1 libxslt1-dev libzip-dev libpq-dev libssh2-1-dev libtidy-dev unzip libc-client-dev libkrb5-dev git \
    && a2enmod rewrite \
    && docker-php-ext-configure zip \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
    && printf "\n" | pecl install memcached-2.2.0 \
    && printf "\n" | pecl install memcache-2.2.7 \
    && printf "\n" | pecl install redis-4.3.0 \
    && printf "\n" | pecl install mongo \
    && printf "\n" | pecl install mongodb-1.7.5 \
    && printf "\n" | pecl install amqp \
    && printf "\n" | pecl install ssh2-0.13 \
    && printf "\n" | pecl install https://xdebug.org/files/xdebug-2.5.5.tgz \
    && printf "\n" | pecl install rar \
    && printf "\n" | pecl install dbase-5.1.1 \
    && docker-php-ext-enable memcached memcache redis mongo mongodb amqp ssh2 xdebug rar dbase \
    && docker-php-ext-install bcmath bz2 calendar exif opcache pdo_mysql mysql mysqli intl zip soap gd xsl pcntl sockets imap tidy \
    && a2enmod ssl \
    && chmod 777 /var/log
