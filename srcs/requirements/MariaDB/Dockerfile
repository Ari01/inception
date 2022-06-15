FROM alpine:3.15

VOLUME [ "/sys/fs/cgroup" ]

# packages
RUN apk update && apk add \
openrc sudo \
mysql mysql-client

#RUN mkdir -p /home/dchheang/data

# script
COPY mysql.sh /home/docker/script/mysql.sh
COPY database.sh /home/docker/script/database.sh
COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# rights
RUN chown -R mysql:mysql \
#/home/dchheang/data \
/var/lib/mysql \
/home/docker/script

#VOLUME /home/dchheang/data

CMD sh /home/docker/script/mysql.sh
