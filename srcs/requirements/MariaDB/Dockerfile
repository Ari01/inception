FROM alpine:3.15

# packages
RUN apk update && apk add \
openrc \
mysql mysql-client

VOLUME [ /home/dchheang/data ]

# script
COPY mysql.sh /home/docker/script/mysql.sh
COPY database.sh /home/docker/script/database.sh
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# rights
RUN chown -R mysql:mysql \
/home/dchheang/data \
/var/lib/mysql \
/home/dchheang/data \
/home/docker/script

CMD sh /home/docker/script/mysql.sh
