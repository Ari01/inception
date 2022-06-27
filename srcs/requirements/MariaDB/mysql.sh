mkdir /run/openrc
touch /run/openrc/softlevel

MYSQL_HOST=""
/etc/init.d/mariadb setup
chown -R mysql:mysql /usr/bin/mysqld
rc-status
/etc/init.d/mariadb start
mysql -uroot -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PWD}'; FLUSH PRIVILEGES;"
#mysql -uroot -p${MYSQL_ROOT_PWD} < "FLUSH PRIVILEGES"
#mysql_secure_installation -p{$MYSQL_ROOT_PWD} --skip-grant-tables -D
mysql -uroot -p${MYSQL_ROOT_PWD} -e "CREATE USER IF NOT EXISTS 'user42'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}'"
mysql -uroot -p${MYSQL_ROOT_PWD} < /home/docker/script/database.sh 

/etc/init.d/mariadb stop

exec /usr/bin/mysqld --user=mysql --console
