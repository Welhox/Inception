
# # Use a minimal Alpine Linux as the base image
# FROM alpine:3.20

# # Set build arguments for database credentials
# ARG DB_NAME
# ARG DB_USER
# ARG DB_PASS
# ARG DB_ROOT
# #root maybe not needed?

# # Install MariaDB and required dependencies
# RUN apk update && apk add --no-cache mariadb mariadb-client

# # Set up MariaDB data directory
# RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# # Copy initialization script
# COPY requirements/mariadb/tools/init.sql /docker-entrypoint-initdb.d/
# # RUN chmod +x /entrypoint.sh
# # Set up database
# RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# # COPY requirements/mariadb/conf/create_db.sh .
# # RUN sh create_db.sh && rm create_db.sh
# USER mysql

# # Configure MariaDB to start
# # CMD ["sh", "-c", "mysqld --user=mysql --datadir=/var/lib/mysql & sleep 5 && mariadb -u root < /docker-entrypoint-initdb.d/init.sql && wait"]

# CMD ["mysqld", "--user=mysql", "--datadir=/var/lib/mysql", "--skip-networking=0", "--default-authentication-plugin=mysql_native_password", "/docker-entrypoint-initdb.d/init.sql"]

# # RUN mysqld --user=mysql --bootstrap < /docker-entrypoint-initdb.d/init.sql

# # Expose MariaDB port
# EXPOSE 3306

# Use minimal Alpine as base
FROM alpine:3.20

# Set build arguments for database credentials
ARG DB_NAME
ARG DB_USER
ARG DB_PASS
ARG DB_ROOT

# Install MariaDB and dependencies
RUN apk update && apk add --no-cache mariadb mariadb-client

# Set up MariaDB data directory
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

# Copy initialization script
COPY requirements/mariadb/tools/init.sql /docker-entrypoint-initdb.d/
COPY requirements/mariadb/tools/entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Expose MariaDB port
EXPOSE 3306