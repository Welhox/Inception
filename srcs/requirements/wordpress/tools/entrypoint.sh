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

# Set up WordPress if not already installed
# if [ ! -f /var/www/wp-config.php ]; then
#     echo "Setting up wp-config.php..."
#     wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST" --allow-root
# fi

# Run the wp-config setup script
# sh /var/www/wp-config-create.sh
sh /var/www/setup-wp-config.sh

# Start PHP-FPM
exec php-fpm82 -F
