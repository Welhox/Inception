#!/bin/sh

# Define the path to wp-config.php
CONFIG_FILE="/var/www/wp-config.php"

# Replace placeholders with environment variables
sed -i "s/database_name_here/${DB_NAME}/g" "$CONFIG_FILE"
sed -i "s/username_here/${DB_USER}/g" "$CONFIG_FILE"
sed -i "s/password_here/${DB_PASS}/g" "$CONFIG_FILE"
# should be DB_PASSWORD
sed -i "s/localhost/${DB_HOST}/g" "$CONFIG_FILE"

# # Generate unique keys using the WordPress API
KEYS=$(curl -s https://api.wordpress.org/secret-key/1.1/salt/)
if [ -n "$KEYS" ]; then
    # Replace the default key placeholders with the generated keys
    sed -i "/AUTH_KEY/d" "$CONFIG_FILE"
    sed -i "/SECURE_AUTH_KEY/d" "$CONFIG_FILE"
    sed -i "/LOGGED_IN_KEY/d" "$CONFIG_FILE"
    sed -i "/NONCE_KEY/d" "$CONFIG_FILE"
    sed -i "/AUTH_SALT/d" "$CONFIG_FILE"
    sed -i "/SECURE_AUTH_SALT/d" "$CONFIG_FILE"
    sed -i "/LOGGED_IN_SALT/d" "$CONFIG_FILE"
    sed -i "/NONCE_SALT/d" "$CONFIG_FILE"

    echo "$KEYS" >> "$CONFIG_FILE"
fi

echo "✅ wp-config.php has been configured successfully!"