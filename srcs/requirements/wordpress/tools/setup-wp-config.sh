# #!/bin/sh

# # Define the path to wp-config.php
# CONFIG_FILE="/var/www/wp-config.php"

# # Replace placeholders with environment variables
# sed -i "s/database_name_here/${DB_NAME}/g" "$CONFIG_FILE"
# sed -i "s/username_here/${DB_USER}/g" "$CONFIG_FILE"
# sed -i "s/password_here/${DB_PASS}/g" "$CONFIG_FILE"
# sed -i "s/localhost/${DB_HOST}/g" "$CONFIG_FILE"

# # # Generate unique keys using the WordPress API
# KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
# if [ -n "$KEYS" ]; then
#     # Replace the default key placeholders with the generated keys
#     sed -i "/AUTH_KEY/d" "$CONFIG_FILE"
#     sed -i "/SECURE_AUTH_KEY/d" "$CONFIG_FILE"
#     sed -i "/LOGGED_IN_KEY/d" "$CONFIG_FILE"
#     sed -i "/NONCE_KEY/d" "$CONFIG_FILE"
#     sed -i "/AUTH_SALT/d" "$CONFIG_FILE"
#     sed -i "/SECURE_AUTH_SALT/d" "$CONFIG_FILE"
#     sed -i "/LOGGED_IN_SALT/d" "$CONFIG_FILE"
#     sed -i "/NONCE_SALT/d" "$CONFIG_FILE"

#     echo "$KEYS" >> "$CONFIG_FILE"
# fi

#!/bin/sh

# Define WordPress installation directory
WP_PATH="/var/www/html"

# Ensure the directory exists
mkdir -p "$WP_PATH"

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

# Install WordPress
/usr/local/bin/wp core install \
  --url="https://${WP_HOST}" \
  --title="${WP_TITLE}" \
  --admin_user="${ADM_WP_NAME}" \
  --admin_password="${ADM_WP_PASS}" \
  --admin_email="${ADM_WP_EMAIL}"

# Create additional WordPress user
/usr/local/bin/wp user create "${WP_USERNAME}" "${WP_USEREMAIL}" \
  --role="editor" --user_pass="${WP_USERPASS}"

# Set appropriate ownership and permissions
chown -R www-data:www-data "$WP_PATH"
chmod -R 755 "$WP_PATH"

echo "✅ wp-config.php has been configured successfully!"