FROM bctandoc/symfony-4-docker

RUN echo "date.timezone = Europe/Warsaw" >> $PHP_INI_DIR/php.ini

RUN apt-get update && apt-get install -y zlib1g-dev libicu-dev g++

RUN docker-php-ext-configure intl

RUN docker-php-ext-install -j$(nproc) intl

RUN docker-php-ext-install exif

RUN docker-php-ext-install fileinfo

RUN /bin/dd if=/dev/zero of=/var/swapfile bs=1M count=1024
