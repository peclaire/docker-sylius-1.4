FROM jakubsacha/symfony-docker:php5-dev
#FROM bobey/docker-gitlab-ci-runner-php5.6

RUN docker-php-ext-install bcmath mysqli

RUN apt-get update

RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev

RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN docker-php-ext-install gd

RUN apt-get install unzip


