#php-fpm7
cd /var/www/html/wordpress/
wp core download
cp /home/docker/script/wp-config.php .

#wp core config --dbname=wp --dbuser=root --dbpass=user42 --dbhost=mysql --dbprefix=wp_
wp core install --url=$DOMAIN_NAME/wordpress --title="test" --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email="admin@test.fr" --path=/var/www/html/wordpress/

wp user create author author@test.fr --role=author --path=/var/www/html/wordpress/
wp user create author2 author2@test.fr --role=author --path=/var/www/html/wordpress/
/usr/sbin/php-fpm7 -F -R
