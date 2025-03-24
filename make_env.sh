#!/bin/bash

LOGIN="clundber"
WP_USER="normy"
WP_ADM_USER="boss"

DB_PW="42"
DB_ROOT_PW="42"
WP_USERPASS="42"
ADM_WP_PASS="42"

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