mkdir /run/openrc
touch /run/openrc/softlevel

/etc/init.d/mariadb setup
rc-status
#mysql_install_db --datadir=/home/dchheang/data --user=mysql --rpm > /dev/null
/etc/init.d/mariadb start
mysql -u root -puser42 < /home/docker/script/database.sh
/etc/init.d/mariadb stop

exec /usr/bin/mysqld --user=mysql --console
