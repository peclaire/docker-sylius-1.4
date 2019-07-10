FROM epcallan/php7-testing-phpunit:7.2-phpunit7

RUN echo "date.timezone = Europe/Warsaw" >> $PHP_INI_DIR/php.ini

RUN docker-php-ext-install -j$(nproc) intl

RUN docker-php-ext-install exif

RUN docker-php-ext-install fileinfo

