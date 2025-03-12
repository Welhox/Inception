
#!/bin/sh

mkdir -p /run/mysqld /var/lib/mysql /var/log/mysql && chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log/mysql
chmod 755 /run/mysqld
# chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log/mysql

#initialize the database
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mariadb-install-db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi
#setup user rights
mysqld --user=mysql --bootstrap << EOF
USE mysql;
FLUSH PRIVILEGES;
DELETE FROM     mysql.user WHERE User='';
# DELETE FROM     mysql.user WHERE User='wordpress_user';

DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';
CREATE DATABASE ${DB_NAME} CHARACTER SET utf8 COLLATE utf8_general_ci;
CREATE USER '${DB_USER}'@'%' IDENTIFIED by '${DB_PASS}';
GRANT ALL PRIVILEGES ON '${DB_NAME}'.* TO '${DB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

exec mysqld --defaults-file=/etc/my.cnf.d/mariadb-server.cnf

