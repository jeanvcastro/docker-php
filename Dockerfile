FROM ubuntu:20.04

# Set root password 
RUN echo 'root:${ROOT_PASSWORD}' | chpasswd

# Set the timezone
ENV TZ=${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set working directory
WORKDIR /var/www

# Install dependencies
RUN apt-get update && apt-get install -y \
    mysql-server \
    redis-server \
    nginx \
    php-fpm \
    php-mysql \
    php-igbinary \
    php-redis \
    php-mysql \
    php-mbstring \
    php-bcmath \
    php-xml \
    php-json \
    php-curl \
    php-gd \
    php-intl \
    php-zip \
    php-xdebug \
    unzip \
    curl \
    nano \
    npm

# Clear cache
RUN apt-get autoremove -y && apt-get autoclean && rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Start script
COPY docker-start /usr/bin/
RUN chmod +x /usr/bin/docker-start

ENTRYPOINT [ "docker-start" ]

# Expose ports
EXPOSE 80 443 3306 6379