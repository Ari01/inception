FROM alpine:3.15

# packages
RUN apk update && apk add \
curl \
wget \
php7 php7-fpm php7-opcache php7-mysqli php7-phar php7-json php-mbstring php-gettext

VOLUME [ /home/dchheang/data ]

# WORDPRESS CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# SCRIPT & CONF
COPY wp.sh /home/docker/script/wp.sh
COPY wp-config.php /www/wordpress/wp-config.php 

# USER RIGHTS
RUN adduser -D -g 'user42' user42
RUN chown -R user42:user42 \
/www/wordpress \
/home/dchheang/data \
/home/docker/script/wp.sh

CMD sh /home/docker/script/wp.sh
WORKDIR /www/wordpress
