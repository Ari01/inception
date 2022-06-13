php-fpm7
cd /www/wordpress/
wp core download
#wp core config --dbname=wp --dbuser=root --dbpass=user42 --dbhost=mysql --dbprefix=wp_
wp core install --url="http://dchheang.42.fr" --title="test" --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email="admin@test.fr"

wp user create author author@test.fr --role=author --path=/www/wordpress/
wp user create author2 author2@test.fr --role=author --path=/www/wordpress/
/usr/sbin/php-fpm7 -F -R
