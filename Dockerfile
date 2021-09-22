FROM php:8.0-fpm-alpine3.13 AS ext-amqp

ENV EXT_AMQP_VERSION=master

RUN docker-php-source extract \
    && apk -Uu add git rabbitmq-c-dev \
    && git clone --branch $EXT_AMQP_VERSION --depth 1 https://github.com/php-amqp/php-amqp.git /usr/src/php/ext/amqp \
    && cd /usr/src/php/ext/amqp && git submodule update --init \
    && docker-php-ext-install amqp

RUN ls -al /usr/local/lib/php/extensions/

FROM php:8.0-fpm-alpine3.13

RUN apk add --update \
    bash \
    bzip2-dev \
    nodejs \
    npm \
    zip \
    supervisor \
    nginx \
    curl-dev \
    libxml2-dev \
    libpng-dev \
    icu-dev \
    libzip-dev \
    openrc \
    rabbitmq-c-dev

RUN docker-php-ext-install -j$(nproc) \
    bz2 \
    ctype \
    curl \
    dom \
    exif \
    fileinfo \
    gd \
    iconv \
    intl \
    mysqli \
    pdo \
    pdo_mysql \
    session \
    tokenizer \
    xml \
    zip

COPY --chown=www-data:www-data --from=ext-amqp /usr/local/etc/php/conf.d/docker-php-ext-amqp.ini /usr/local/etc/php/conf.d/docker-php-ext-amqp.ini
COPY --chown=www-data:www-data --from=ext-amqp /usr/local/lib/php/extensions/no-debug-non-zts-20200930/amqp.so /usr/local/lib/php/extensions/no-debug-non-zts-20200930/amqp.so

# Install composer
RUN curl -L "https://getcomposer.org/download/latest-2.x/composer.phar" > /usr/local/bin/composer && chmod 755 /usr/local/bin/composer

CMD php-fpm
