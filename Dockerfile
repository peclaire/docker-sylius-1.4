FROM bctandoc/symfony-4-docker

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++

RUN echo "date.timezone = Europe/Warsaw" >> /etc/php/7.2/cli/php.ini

RUN docker-php-ext-configure intl

RUN docker-php-ext-install exif fileinfo intl
