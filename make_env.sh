#!/bin/bash

NAME="clundber"
NICKNAME="clundber"
DB_PW="42"
DB_ROOT_PW="42"
WP_USERPASS="42"
ADM_WP_PASS="42"

mkdir inception
mkdir inception/srcs
mkdir inception/secrets
echo "secrets" > inception/.gitignore

touch inception/Makefile
mkdir inception/srcs/requirements
touch inception/srcs/docker-compose.yml

mkdir inception/srcs/requirements/mariadb
mkdir inception/srcs/requirements/mariadb/conf
touch inception/srcs/requirements/mariadb/conf/create_db.sh
mkdir inception/srcs/requirements/mariadb/tools
touch inception/srcs/requirements/mariadb/tools/.gitkeep
touch inception/srcs/requirements/mariadb/Dockerfile
mkdir inception/srcs/requirements/nginx
mkdir inception/srcs/requirements/nginx/conf
touch inception/srcs/requirements/nginx/conf/nginx.conf
mkdir inception/srcs/requirements/nginx/tools
touch inception/srcs/requirements/nginx/tools/.gitkeep
touch inception/srcs/requirements/nginx/Dockerfile
mkdir inception/srcs/word.txt
echo $ADM_WP_PASS > inception/secrets/adm_wp_password.txt

echo '#!/bin/bashrequirements/tools
touch inception/srcs/requirements/tools/.gitkeep
mkdir inception/srcs/requirements/wordpress
mkdir inception/srcs/requirements/wordpress/conf
touch inception/srcs/requirements/wordpress/conf/wp-config-create.sh
mkdir inception/srcs/requirements/wordpress/tools
touch inception/srcs/requirements/wordpress/tools/.gitkeep
touch inception/srcs/requirements/wordpress/Dockerfile

touch inception/secrets/credentials.txt
echo "DOMAIN_NAME=$NICKNAME.42.fr" > inception/secrets/credentials.txt
echo "CERT_=./requirements/tools/$NICKNAME.42.fr.crt" >> inception/secrets/credentials.txt
echo "KEY_=./requirements/tools/$NICKNAME.42.fr.key" >> inception/secrets/credentials.txt
echo "DB_NAME=wordpress" >> inception/secrets/credentials.txt
echo "DB_USER=wpuser" >> inception/secrets/credentials.txt
echo "DB_HOST=mariadb" >> inception/secrets/credentials.txt
echo "WP_TITLE=INCEPTION_$NAME" >> inception/secrets/credentials.txt
echo "WP_USERNAME=$NAME" >> inception/secrets/credentials.txt
echo "WP_USEREMAIL=$NAME@42.fr" >> inception/secrets/credentials.txt
echo "WP_USERPASS=$NAME" >> inception/secrets/credentials.txt
echo "WP_HOST=$NICKNAME.42.fr" >> inception/secrets/credentials.txt
echo "ADM_WP_NAME=$NAME" >> inception/secrets/credentials.txt
echo "ADM_WP_EMAIL=$NAME@42.fr" >> inception/secrets/credentials.txt

echo $DB_PW > inception/secrets/db_password.txt
echo $DB_ROOT_PW > inception/secrets/db_root_password.txt
echo $WP_USERPASS > inception/secrets/wp_password.txt
echo $ADM_WP_PASS > inception/secrets/adm_wp_password.txt

echo '#!/bin/bash

cp secrets/credentials.txt srcs/.env

DB_PASSWORD_FILE=$(cat "secrets/db_root_password.txt")
echo "DB_ROOT=$DB_PASSWORD_FILE" >> srcs/.env

DB_PASSWORD_FILE=$(cat "secrets/wp_password.txt")
echo "WP_USERPASS=$DB_PASSWORD_FILE" >> srcs/.env 

DB_PASSWORD_FILE=$(cat "secrets/db_password.txt")
echo "DB_PASS=$DB_PASSWORD_FILE" >> srcs/.env

DB_PASSWORD_FILE=$(cat "secrets/adm_wp_password.txt")
echo "ADM_WP_PASS=$DB_PASSWORD_FILE" >> srcs/.env' > inception/make_env.sh

chmod +x inception/make_env.sh



# #!/bin/bash

# cp secrets/credentials.txt srcs/.env

# DB_PASSWORD_FILE=$(cat "secrets/db_root_password.txt")
# echo "DB_ROOT=$DB_PASSWORD_FILE" >> srcs/.env

# DB_PASSWORD_FILE=$(cat "secrets/wp_password.txt")
# echo "WP_USERPASS=$DB_PASSWORD_FILE" >> srcs/.env 

# DB_PASSWORD_FILE=$(cat "secrets/db_password.txt")
# echo "DB_PASS=$DB_PASSWORD_FILE" >> srcs/.env

# DB_PASSWORD_FILE=$(cat "secrets/adm_wp_password.txt")
# echo "ADM_WP_PASS=$DB_PASSWORD_FILE" >> srcs/.env
