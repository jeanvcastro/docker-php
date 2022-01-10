FROM ubuntu:20.04

# Install nodejs
RUN apt-get update && apt-get install -y curl \
    && curl -sL https://deb.nodesource.com/setup_17.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g npm

# Install PHP
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E5267A6C \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C \
    && echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu focal main" > /etc/apt/sources.list.d/ppa_ondrej_php.list \
    && apt-get update && apt-get install -y unzip \
    php7.4-fpm \
    php7.4-mysql \
    php7.4-igbinary \
    php7.4-redis \
    php7.4-mbstring \
    php7.4-bcmath \
    php7.4-xml \
    php7.4-json \
    php7.4-curl \
    php7.4-gd \
    php7.4-intl \
    php7.4-zip \
    php7.4-xdebug

# Clear cache
RUN apt-get autoremove -y && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Configure php-fpm to listen on port 9000 and get xdebug configs from environment variables
RUN { echo; echo 'listen = 9000'; echo 'clear_env = no'; } >> /etc/php/7.4/fpm/pool.d/www.conf

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the timezone
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Set working directory
WORKDIR /var/www

# Start script
COPY docker-start /usr/bin/
RUN chmod +x /usr/bin/docker-start

ENTRYPOINT [ "docker-start" ]