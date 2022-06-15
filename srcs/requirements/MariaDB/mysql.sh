mkdir /run/openrc
touch /run/openrc/softlevel

MYSQL_HOST=""
/etc/init.d/mariadb setup
rc-status
/etc/init.d/mariadb start
sudo mysql -e "CREATE USER IF NOT EXISTS 'user42'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}'"
sudo mysql < /home/docker/script/database.sh 

/etc/init.d/mariadb stop

exec /usr/bin/mysqld --user=mysql --console
