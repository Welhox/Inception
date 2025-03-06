-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS ${DB_NAME};

-- Create the user if it doesn't exist and grant privileges
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';

-- Set root password (optional)
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT}';

-- Apply changes
FLUSH PRIVILEGES;
