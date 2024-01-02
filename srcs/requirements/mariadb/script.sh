#!/bin/bash

if [ ! -d "/var/lib/mysql/$DBNAME" ]; then
service mariadb start;

sleep 5;

# Set root password
echo "++++++++++++++++++++++++++++++++++++++Estou AQUIIIIII++++++++++++++++++++++++++++++++++++++++++++"

# Create database and table
mysql -u root -e "CREATE DATABASE IF NOT EXISTS $DBNAME;"
mysql -u root -e "USE $DBNAME; CREATE TABLE IF NOT EXISTS User (id INT AUTO_INCREMENT PRIMARY KEY, username VARCHAR(255) NOT NULL, comment TEXT NOT NULL);"

# Example: Insert a user
mysql -u root -e "USE $DBNAME; INSERT INTO User (username, comment) VALUES ('example_user', 'This is a comment.');"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO '$DBUSER'@'%' IDENTIFIED BY '$DBPASS'; FLUSH PRIVILEGES;"
fi

exec mysqld_safe --bind-address=0.0.0.0