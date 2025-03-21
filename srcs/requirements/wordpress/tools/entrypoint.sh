#!/bin/sh

while ! mariadb -h$DB_HOST -u$DB_USER -p$DB_PASS >/dev/null; do
    echo "Waiting for MariaDB to be available..."
    sleep 3
done

chown -R www-data:www-data /var/www/html
chmod -R 755 /var/www/html


# Define WordPress installation directory
WP_PATH="/var/www/html"

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

echo "✅ wp-config.php has been configured successfully!"

# Install WordPress if it's not installed
echo "Installing WordPress..."
wp core install --allow-root \
    --url="https://$DOMAIN_NAME" \
    --title="$WP_TITLE" \
    --admin_user="$ADM_WP_NAME" \
    --admin_password="$ADM_WP_PASS" \
    --admin_email="$ADM_WP_EMAIL" \
    --path=/var/www/html \
    --skip-email \

    # Set and flush permalinks during setup
    wp rewrite structure '/%postname%/' --allow-root
    wp rewrite flush --allow-root
    
    # Install and activate theme
    wp theme install oceanic --activate

    # Create a regular WordPress user
    wp user create "$WP_USERNAME" "$WP_USEREMAIL" --role=editor --user_pass="$WP_USERPASS" --allow-root --path=/var/www/html

# Start PHP-FPM
exec php-fpm82 -F
