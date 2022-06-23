mkdir /run/openrc
touch /run/openrc/softlevel

MYSQL_HOST=""
/etc/init.d/mariadb setup
rc-status
/etc/init.d/mariadb start
sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH caching_sha2_password BY '${MYSQL_ROOT_PWD}'"
sudo mysql < "FLUSH PRIVILEGES"
mysql -uroot -p${MYSQL_ROOT_PWD} -e "CREATE USER IF NOT EXISTS 'user42'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}'"
mysql -uroot -p${MYSQL_ROOT_PWD} < /home/docker/script/database.sh 

/etc/init.d/mariadb stop

exec /usr/bin/mysqld --user=mysql --console
