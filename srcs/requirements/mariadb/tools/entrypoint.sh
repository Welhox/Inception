#!/bin/sh
set -e

DATA_DIR="/var/lib/mysql"
INIT_FLAG="${DATA_DIR}/.init_done"

# Ensure proper ownership of MySQL files
chown -R mysql:mysql ${DATA_DIR} /run/mysqld

# If the database directory is empty, initialize it
if [ ! -d "$DATA_DIR/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=${DATA_DIR}
fi

# Start MariaDB in the background
mysqld --user=mysql --datadir=${DATA_DIR} --skip-networking &
MARIADB_PID=$!

# Wait for MariaDB to be ready
echo "Waiting for MariaDB to be ready..."
until mariadb -u root -e "SELECT 1" >/dev/null 2>&1; do
    sleep 2
done

# Run init.sql only if it hasn't been executed before
if [ ! -f "$INIT_FLAG" ]; then
    echo "Running initialization script..."
    mariadb -u root < /docker-entrypoint-initdb.d/init.sql
    touch "$INIT_FLAG"
    echo "Initialization complete!"
else
    echo "Database already initialized. Skipping init.sql"
fi

# Stop the background MariaDB process
kill "$MARIADB_PID"
wait "$MARIADB_PID"

# Start MariaDB normally in the foreground
exec mysqld --user=mysql --datadir=${DATA_DIR}

