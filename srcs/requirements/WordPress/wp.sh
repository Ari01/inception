cd /var/www/html/wordpress/
wp core download
mv /home/docker/script/wp-config.php .

while ! mariadb -h$MYSQL_HOST -u$WP_DATABASE_USR -p$WP_DATABASE_PWD &>/dev/null; do
	sleep 3
done

wp core install --url=$DOMAIN_NAME --title="test" --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email="admin@test.fr" --path=/var/www/html/wordpress/

wp user create author author@test.fr --role=author --path=/var/www/html/wordpress/
wp user create author2 author2@test.fr --role=author --path=/var/www/html/wordpress/
/usr/sbin/php-fpm7 -F -R
