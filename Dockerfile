FROM php:7.2-cli
MAINTAINER Claire Ravelo <peclaire11@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq \
    && apt-get install git zlib1g-dev libsqlite3-dev -y \
    && docker-php-ext-install zip \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install pdo_sqlite \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-ext-install exif \
    && docker-php-ext-install fileinfo \

RUN curl -fsSL https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer \
    && composer global require phpunit/phpunit ^5.7 --no-progress --no-scripts --no-interaction

RUN pecl install xdebug \
    && echo 'zend_extension=/usr/local/lib/php/extensions/no-debug-non-zts-20151012/xdebug.so' > \
        /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
    && php -m | grep xdebug

ENV PATH /root/.composer/vendor/bin:$PATH

RUN echo "date.timezone = Europe/Warsaw" >> /etc/php/7.2/cli/php.ini

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install gd

RUN docker-php-ext-configure intl

RUN docker-php-ext-install intl

CMD ["phpunit"]
