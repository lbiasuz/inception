#!/bin/sh

if wp core is-installed --allow-root --path=/var/www/html; then
    echo "WordPress is already installed";
else
    wp core download --allow-root
    
    mv wp-config-sample.php wp-config.php
    wp config set DB_NAME $MYSQL_DATABASE --allow-root
    wp config set DB_USER $MYSQL_USER --allow-root
    wp config set DB_PASSWORD $MYSQL_PASSWORD --allow-root
    wp config set DB_HOST mariadb:3306 --allow-root
    
    wp core install --path=/var/www/html --allow-root --url=lbiasuz.42.fr --title='inception' \
                    --admin_user=$ADM_USER --admin_password=$ADM_PASSWORD --admin_email=$ADM_EMAIL --skip-email
    
    wp --allow-root user create $USER_NAME $USER_EMAIL --role=editor --user_pass=$USER_PASSWORD

    chown -R www-data:www-data /var/www/html

fi

exec /usr/sbin/php-fpm7.4 -F