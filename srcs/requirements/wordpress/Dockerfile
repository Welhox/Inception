FROM alpine:3.20

# Install required dependencies
RUN apk update && apk add --no-cache \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-curl \
    php82-gd \
    php82-mbstring \
    php82-xml \
    php82-zip \
    php82-soap \
    php82-exif \
    php82-pdo_mysql \
    php82-opcache \
    php82-openssl \
    php82-json \
    php82-dom \
    php82-fileinfo \
    php82-redis \
    php82-phar \
    mariadb-client \
    curl \
    tar
    # nginx \
    # supervisor

# create www-data user and group
RUN addgroup -S nginx && adduser -S nginx -G nginx || true

# # Set up working directory
# WORKDIR /var/www/

# create a symlink for php
RUN ln -s /usr/bin/php82 /usr/bin/php

# Download and extract WordPress
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

# Fix permissions
# RUN chown -R nginx:nginx /var/www/
# RUN chown -R www-data:www-data /var/www/

# create and copy conf
RUN mkdir -p /run/php/ /var/www/html

# Copy entrypoint script and conf file
COPY requirements/wordpress/conf/www.conf etc/php82/php-fpm.d/www.conf
COPY requirements/wordpress/tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# copy config file and script to fill it
# COPY requirements/wordpress/tools/wp-config-create.sh /var/www/
# RUN chmod +x /var/www/wp-config-create.sh
COPY requirements/wordpress/conf/wp-config.php /var/www/
COPY requirements/wordpress/tools/setup-wp-config.sh /var/www/
RUN chmod +x /var/www/setup-wp-config.sh

# Expose PHP-FPM port
EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]

