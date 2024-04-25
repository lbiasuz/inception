FROM alpine:3.18

EXPOSE 3306

RUN apk update && \
    apk add mariadb mariadb-client openrc

COPY tools/entrypoint.sh /tmp/entrypoint.sh
COPY conf/my.cnf /etc/my.cnf

RUN mkdir -p /var/lib/mysql /var/run/mysqld /run/mysqld
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld /run/mysqld /tmp/

USER mysql

ENTRYPOINT [ "sh", "/tmp/entrypoint.sh"]