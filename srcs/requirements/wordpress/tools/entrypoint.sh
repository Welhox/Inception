#!/bin/sh

# # Ensure PHP-FPM runs properly
# mkdir -p /run/php


# Wait for MariaDB
# while ! mariadb -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASS" -e "SELECT 1" >/dev/null 2>&1; do

# while ! mysql -h$DB_HOST -u$DB_USER -p$DB_PASS $DB_NAME "SELECT 1" >/dev/null 2>&1; do
#     echo "Waiting for MariaDB to be available..."
#     sleep 3
# done

while ! mariadb -h$DB_HOST -u$DB_USER -p$DB_PASS >/dev/null; do
    echo "Waiting for MariaDB to be available..."
    sleep 3
done



# Run the wp-config setup script
# sh /var/www/wp-config-create.sh
sh /var/www/setup-wp-config.sh


# Install WordPress if it's not installed
if ! wp core is-installed --allow-root --path=/var/www/html; then
    echo "Installing WordPress..."
    wp core install --allow-root \
        --url="http://$DOMAIN_NAME" \
        --title="$WP_TITLE" \
        --admin_user="$ADM_WP_NAME" \
        --admin_password="$ADM_WP_PASS" \
        --admin_email="$ADM_WP_EMAIL" \
        --path=/var/www/html
    
    # Create a regular WordPress user
    wp user create "$WP_USERNAME" "$WP_USEREMAIL" --role=editor --user_pass="$WP_USERPASS" --allow-root --path=/var/www/html
fi


# wp core install 

# Start PHP-FPM
exec php-fpm82 -F
