
#!/bin/sh

mkdir -p /etc/my.cnf.d

cat >> /tmp/init.sql << EOF
CREATE DATABASE $MYSQL_DATABASE;
CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
EOF

if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then
	mysqld --port=3306 --bind-address=mariadb
else
	mariadb-install-db --user=mysql --datadir=/var/lib/mysql
	mysqld --init-file="/tmp/init.sql" --port=3306 --bind-address=mariadb
fi

exec $@