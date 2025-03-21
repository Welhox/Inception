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
    php82-tokenizer \
    curl \
    wget \
    zip \
    tar

# create www-data user and group
RUN adduser -S www-data -G www-data || true


# create and copy conf
RUN mkdir -p /run/php/ /var/www/html

# Set up working directory
WORKDIR /var/www/html

# create a symlink for php
RUN ln -s /usr/bin/php82 /usr/bin/php

RUN curl -o wordpress.tar.gz https://wordpress.org/wordpress-6.6.2.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz


# Fix permissions
RUN chown -R www-data:www-data /var/www/html/


# Copy entrypoint script and conf file
COPY requirements/wordpress/conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY requirements/wordpress/tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY requirements/wordpress/tools/setup-wp-config.sh /var/www/
RUN chmod +x /var/www/setup-wp-config.sh

# Install WP-CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

# Expose PHP-FPM port
EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]

