#!/bin/bash

LOGIN="clundber"
WP_USER="normy"
WP_ADM_USER="boss"

DB_PW="42"
DB_ROOT_PW="42"
WP_USERPASS="42"
ADM_WP_PASS="42"

# add deletion of .env if it already exists

# touch srcs/.env
echo "DOMAIN_NAME=clundber.42.fr" > srcs/.env
echo "CERT_=./requirements/nginx/tools/clundber.42.fr.crt" >> srcs/.env
echo "KEY_=./requirements/nginx/tools/clundber.42.fr.key" >> srcs/.env
echo "DB_NAME=wordpress" >> srcs/.env
echo "DB_USER=wpuser" >> srcs/.env
echo "DB_HOST=mariadb" >> srcs/.env
echo "WP_TITLE=INCEPTION_BY_$LOGIN" >> srcs/.env
echo "WP_USERNAME=$WP_USER" >> srcs/.env
echo "WP_USEREMAIL=$WP_USER@42.fr" >> srcs/.env
echo "WP_USERPASS=$WP_USERPASS" >> srcs/.env
echo "WP_HOST=clundber.42.fr" >> srcs/.env
echo "ADM_WP_NAME=$WP_ADM_USER" >> srcs/.env
echo "ADM_WP_EMAIL=$WP_ADM_USER@42.fr" >> srcs/.env

echo "DB_ROOT=$DB_ROOT_PW" >> srcs/.env
echo "WP_USERPASS=$WP_USERPASS" >> srcs/.env
echo "DB_PASS=$DB_PW" >> srcs/.env
echo "ADM_WP_PASS=$ADM_WP_PASS" >> srcs/.env


# mkdir inception
# mkdir inception/srcs
# mkdir inception/secrets
# echo "secrets" > inception/.gitignore

# touch inception/Makefile
# mkdir inception/srcs/requirements
# touch inception/srcs/docker-compose.yml

# mkdir inception/srcs/requirements/mariadb
# mkdir inception/srcs/requirements/mariadb/conf
# touch inception/srcs/requirements/mariadb/conf/create_db.sh
# mkdir inception/srcs/requirements/mariadb/tools
# touch inception/srcs/requirements/mariadb/tools/.gitkeep
# touch inception/srcs/requirements/mariadb/Dockerfile
# mkdir inception/srcs/requirements/nginx
# mkdir inception/srcs/requirements/nginx/conf
# touch inception/srcs/requirements/nginx/conf/nginx.conf
# mkdir inception/srcs/requirements/nginx/tools
# touch inception/srcs/requirements/nginx/tools/.gitkeep
# touch inception/srcs/requirements/nginx/Dockerfile
# mkdir inception/srcs/word.txt
# echo $ADM_WP_PASS > inception/secrets/adm_wp_password.txt

# echo '#!/bin/bashrequirements/tools
# touch inception/srcs/requirements/tools/.gitkeep
# mkdir inception/srcs/requirements/wordpress
# mkdir inception/srcs/requirements/wordpress/conf
# touch inception/srcs/requirements/wordpress/conf/wp-config-create.sh
# mkdir inception/srcs/requirements/wordpress/tools
# touch inception/srcs/requirements/wordpress/tools/.gitkeep
# touch inception/srcs/requirements/wordpress/Dockerfile

# touch inception/secrets/credentials.txt
# echo "DOMAIN_NAME=$LOGIN.42.fr" > inception/secrets/credentials.txt
# echo "CERT_=./requirements/tools/$LOGIN.42.fr.crt" >> inception/secrets/credentials.txt
# echo "KEY_=./requirements/tools/$LOGIN.42.fr.key" >> inception/secrets/credentials.txt
# echo "DB_NAME=wordpress" >> inception/secrets/credentials.txt
# echo "DB_USER=wpuser" >> inception/secrets/credentials.txt
# echo "DB_HOST=mariadb" >> inception/secrets/credentials.txt
# echo "WP_TITLE=INCEPTION_$LOGIN" >> inception/secrets/credentials.txt
# echo "WP_USERNAME=$LOGIN" >> inception/secrets/credentials.txt
# echo "WP_USEREMAIL=$LOGIN@42.fr" >> inception/secrets/credentials.txt
# echo "WP_USERPASS=$LOGIN" >> inception/secrets/credentials.txt
# echo "WP_HOST=$LOGIN.42.fr" >> inception/secrets/credentials.txt
# echo "ADM_WP_NAME=$LOGIN" >> inception/secrets/credentials.txt
# echo "ADM_WP_EMAIL=$LOGIN@42.fr" >> inception/secrets/credentials.txt

# echo $DB_PW > inception/secrets/db_password.txt
# echo $DB_ROOT_PW > inception/secrets/db_root_password.txt
# echo $WP_USERPASS > inception/secrets/wp_password.txt
# echo $ADM_WP_PASS > inception/secrets/adm_wp_password.txt

# echo '#!/bin/bash

# cp secrets/credentials.txt srcs/.env

# DB_PASSWORD_FILE=$(cat "secrets/db_root_password.txt")
# echo "DB_ROOT=$DB_PASSWORD_FILE" >> srcs/.env

# DB_PASSWORD_FILE=$(cat "secrets/wp_password.txt")
# echo "WP_USERPASS=$DB_PASSWORD_FILE" >> srcs/.env 

# DB_PASSWORD_FILE=$(cat "secrets/db_password.txt")
# echo "DB_PASS=$DB_PASSWORD_FILE" >> srcs/.env

# DB_PASSWORD_FILE=$(cat "secrets/adm_wp_password.txt")
# echo "ADM_WP_PASS=$DB_PASSWORD_FILE" >> srcs/.env' > inception/make_env.sh

# chmod +x inception/make_env.sh



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
