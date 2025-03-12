FROM alpine:3.20

# Install required dependencies
RUN apk add --no-cache \
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
    # mariadb-client \
    curl \
    tar \
    # nginx \
    supervisor

# create www-data user and group
RUN adduser -S www-data -G www-data || true

# Set up working directory
WORKDIR /var/www/

# Download and extract WordPress
RUN curl -o wordpress.tar.gz https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz --strip-components=1 && \
    rm wordpress.tar.gz

# Fix permissions
RUN chown -R www-data:www-data /var/www/

# Copy custom entrypoint script
COPY requirements/wordpress/tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# copy config file and script to fill it
COPY requirements/wordpress/conf/wp-config.php /var/www/
COPY requirements/wordpress/tools/setup-wp-config.sh /var/www/
RUN chmod +x /var/www/setup-wp-config.sh

# Expose PHP-FPM port
EXPOSE 9000

ENTRYPOINT ["/entrypoint.sh"]

