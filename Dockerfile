FROM epcallan/php7-testing-phpunit:7.2-phpunit7

RUN apt-get update && apt-get install -y zlib1g-dev

RUN docker-php-ext-install bcmath mysqli zip

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install gd
