
# Use minimal Alpine as base
FROM alpine:3.20

# Install MariaDB and dependencies
RUN apk update && apk add --no-cache mariadb mariadb-client

# Set up MariaDB data directory
RUN mkdir -p /run/mysqld /var/lib/mysql /var/log/mysql && chown -R mysql:mysql /run/mysqld /var/lib/mysql /var/log/mysql

# Copy initialization script
COPY requirements/mariadb/tools/entrypoint.sh /entrypoint.sh
COPY requirements/mariadb/conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

# Make the entrypoint script executable
RUN chmod +x /entrypoint.sh
RUN chmod +x /etc/my.cnf.d/mariadb-server.cnf

# Expose MariaDB port
EXPOSE 3306

# Set entrypoint
ENTRYPOINT ["sh", "/entrypoint.sh"]
