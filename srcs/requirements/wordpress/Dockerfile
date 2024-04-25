FROM debian:oldstable

WORKDIR /var/www/html/
EXPOSE 9000

RUN apt-get update && apt-get install -y \
    wget \
    php7.4 \
    php7.4-fpm \
    php7.4-cli \
    php7.4-curl \
    php7.4-mysqli \
    php7.4-mbstring \
    php7.4-xml \
    php7.4-gd

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    --output-document=/usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp && \
    mkdir -p /run/php /var/www/html/ && \
    chmod -R 755 /var/www/html/

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/entrypoint.sh /usr/local/bin/

RUN chmod 755 /etc/php/7.4/fpm/pool.d/www.conf 

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]