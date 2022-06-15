mkdir /run/openrc
touch /run/openrc/softlevel

MYSQL_HOST=""
/etc/init.d/mariadb setup
rc-status
#mysql_install_db --datadir=/home/dchheang/data --user=mysql --rpm > /dev/null
/etc/init.d/mariadb start
#mysql -u root -p '$WP_DATABASE_PWD' < /home/docker/script/database.sh
sudo mysql -e "CREATE USER IF NOT EXISTS 'user42'@'%' IDENTIFIED BY '${MYSQL_ROOT_PWD}'"
sudo mysql < /home/docker/script/database.sh 

/etc/init.d/mariadb stop

exec /usr/bin/mysqld --user=mysql --console
