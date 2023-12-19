#!/bin/bash

# MySQL commands
MYSQL_CMD="mysql -u$DB_USER -p$DB_PASSWORD"

# Execute SQL commands
$MYSQL_CMD -e "CREATE DATABASE $DB_NAME;"
$MYSQL_CMD -e "CREATE USER '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost';"
$MYSQL_CMD -e "FLUSH PRIVILEGES;"

# Additional steps
$MYSQL_CMD -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
$MYSQL_CMD -e "FLUSH PRIVILEGES;"

# Importing Database Schema (replace schema.sql with your actual SQL file)
if [ -f schema.sql ]; then
    $MYSQL_CMD $DB_NAME < schema.sql
    echo "Database schema imported."
else
    echo "Warning: schema.sql not found. Skipping database schema import."
fi

exec mysqld_safe --bind-address=0.0.0.0

echo "Database setup complete."

