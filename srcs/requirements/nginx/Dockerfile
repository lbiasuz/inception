FROM debian:oldstable

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
    nginx \
    openssl && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl/ && \
	openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/server.key \
	-out /etc/nginx/ssl/server.crt \
	-subj "/C=BR/ST=SP/L=Sao Paulo/O=42SP/CN=lbiasuz" && \
    chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/conf.d

EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]