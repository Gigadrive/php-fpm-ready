# php-fpm-ready

This Docker image provides a ready-to-use environment with PHP 8.0, FPM, various extensions and composer 2 installed.
It also includes the amqp extension, which is currently not available through the `docker-php-ext-install` command.

## Usage

Use the following line in your Dockerfile to start your build with this image:

```docker
FROM "gigadrive/php-fpm-ready:8.0"
```

[Click here to visit the Docker Hub page](https://hub.docker.com/repository/docker/gigadrive/php-fpm-ready).

## Programs included

* composer
* bash
* npm
* nodejs
* supervisor
* php-fpm

## Extensions included

* amqp
* bz2
* ctype
* curl
* dom
* exif
* fileinfo
* gd
* iconv
* intl
* mysqli
* pdo
* pdo_mysql
* session
* session
* tokenizer
* xml
* zip

## Copyright and License

This program was developed by [Mehdi Baaboura](https://github.com/Zeryther) and published by [Gigadrive UG](https://gigadrivegroup.com) under the MIT License. For more information click [here](https://github.com/Gigadrive/php-fpm-ready/blob/master/LICENSE).