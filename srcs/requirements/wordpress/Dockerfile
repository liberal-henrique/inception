FROM debian:bullseye

# Install PHP and WordPress dependencies
RUN apt-get -y update && apt-get -y upgrade


RUN apt-get install -y curl php7.4-fpm php-mysql php-curl php-gd php-mbstring php-xml \
	php-xmlrpc php-soap php-intl php-zip mariadb-client && \
    rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mkdir -p /run/php/ && chmod 755 /run/php/

RUN chmod +x wp-cli.phar
RUN whereis php-fpm

RUN mv wp-cli.phar /usr/local/bin/wp

#RUN sock_path=$(find /etc/php -type s -name 'php*-fpm.sock' | head -n 1)
#RUN sed -i "s#listen = $sock_path#listen = 9000#g" /etc/php/7.3/fpm/pool.d/www.conf

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 9000#g' /etc/php/7.4/fpm/pool.d/www.conf

# Copy your WordPress files and configurations
# COPY wordpress /var/www/html
COPY script.sh .

RUN chmod +x script.sh

# Expose port
EXPOSE 9000

ENTRYPOINT ["./script.sh", "/usr/sbin/php-fpm7.4", "-F", "-R"]