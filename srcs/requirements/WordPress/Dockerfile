FROM alpine:3.15

# packages
RUN apk update && apk add \
curl \
wget \
mariadb-client \
php7 php7-fpm php7-opcache php7-mysqli php7-phar php7-json php-mbstring php-gettext

# WORDPRESS CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

# SCRIPT & CONF
COPY wp.sh /home/docker/script/wp.sh
COPY wp-config.php /home/docker/script/wp-config.php
COPY php-fpm.conf /etc/php7/php-fpm.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf

# USER RIGHTS
RUN adduser -D -g 'user42' user42
RUN mkdir -p /var/www/html/wordpress
RUN chown -R user42:user42 \
/var/www/html/wordpress \
/home/docker/script/wp.sh

CMD sh /home/docker/script/wp.sh
WORKDIR /var/www/html/wordpress
