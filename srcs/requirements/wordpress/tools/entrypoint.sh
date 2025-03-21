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

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html


# Define WordPress installation directory
WP_PATH="/var/www/html"

# # Ensure the directory exists
# mkdir -p "$WP_PATH"

# Change to the WordPress directory
cd "$WP_PATH" || exit 1

# Remove existing wp-config.php if it exists
rm -f wp-config.php

# Create wp-config.php with database settings
/usr/local/bin/wp config create \
  --dbname="${DB_NAME}" \
  --dbuser="${DB_USER}" \
  --dbpass="${DB_PASS}" \
  --dbhost="${DB_HOST}" \
  --force

# Set file system method to direct
/usr/local/bin/wp config set FS_METHOD 'direct'

# # Install WordPress
# /usr/local/bin/wp core install \
#   --url="https://${WP_HOST}" \
#   --title="${WP_TITLE}" \
#   --admin_user="${ADM_WP_NAME}" \
#   --admin_password="${ADM_WP_PASS}" \
#   --admin_email="${ADM_WP_EMAIL}" \
#   --allow-root \
#   && wp theme install oceanic --activate

# # Create additional WordPress user
# /usr/local/bin/wp user create "${WP_USERNAME}" "${WP_USEREMAIL}" \
#   --role="editor" --user_pass="${WP_USERPASS}"

# # Set appropriate ownership and permissions
# chown -R www-data:www-data "$WP_PATH"
# chmod -R 755 "$WP_PATH"

echo "✅ wp-config.php has been configured successfully!"



# # Run the wp-config setup script
# # sh /var/www/wp-config-create.sh
# sh /var/www/setup-wp-config.sh


# Install WordPress if it's not installed
# if ! wp core is-installed --allow-root --path=/var/www/html; then
echo "Installing WordPress..."
wp core install --allow-root \
    --url="https://$DOMAIN_NAME" \
    --title="$WP_TITLE" \
    --admin_user="$ADM_WP_NAME" \
    --admin_password="$ADM_WP_PASS" \
    --admin_email="$ADM_WP_EMAIL" \
    --path=/var/www/html \
    --skip-email \
    # && wp theme install oceanic --activate

    # Set and flush permalinks during setup
    wp rewrite structure '/%postname%/' --allow-root
    wp rewrite flush --allow-root
    
    # Install and activate theme
    wp theme install oceanic --activate

    # Create a regular WordPress user
    wp user create "$WP_USERNAME" "$WP_USEREMAIL" --role=editor --user_pass="$WP_USERPASS" --allow-root --path=/var/www/html
# fi

# Start PHP-FPM
exec php-fpm82 -F
