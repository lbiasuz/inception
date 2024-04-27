FROM alpine:3.18

RUN apk add nginx openssl 

RUN mkdir -p /etc/nginx/ssl/ && \
	openssl req -x509 -nodes -days 365 \
	-newkey rsa:2048 \
	-keyout /etc/nginx/ssl/server.key \
	-out /etc/nginx/ssl/server.crt \
	-subj "/C=BR/ST=SP/L=Sao Paulo/O=42SP/CN=lbiasuz"

COPY ./conf/nginx.conf /etc/nginx/conf.d
COPY ./conf/nginx.conf /etc/nginx/nginx.conf


EXPOSE 443

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]