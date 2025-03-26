#!/bin/bash

# insert user information here before making the project
LOGIN="clundber"
WP_USER=""
WP_ADM_USER=""

DB_PW=""
DB_ROOT_PW=""
WP_USERPASS=""
ADM_WP_PASS=""

# Check if any required variable is empty
if [[ -z "$WP_USER" || -z "$WP_ADM_USER" || -z "$DB_PW" || -z "$DB_ROOT_PW" || -z "$WP_USERPASS" || -z "$ADM_WP_PASS" || -z "$LOGIN" ]]; then
    echo "Error: One or more required variables are empty. Please set them before running the script."
    exit 1
fi

# Write to .env file
cat <<EOF > srcs/.env
DOMAIN_NAME=$LOGIN.42.fr
DB_NAME=wordpress
DB_USER=wpuser
DB_HOST=mariadb
WP_TITLE=INCEPTION_BY_$LOGIN
WP_USERNAME=$WP_USER
WP_USEREMAIL=$WP_USER@42.fr
WP_USERPASS=$WP_USERPASS
WP_HOST=$LOGIN.42.fr
ADM_WP_NAME=$WP_ADM_USER
ADM_WP_EMAIL=$WP_ADM_USER@42.fr
DB_ROOT=$DB_ROOT_PW
DB_PASS=$DB_PW
ADM_WP_PASS=$ADM_WP_PASS
EOF

echo ".env file created successfully!"
