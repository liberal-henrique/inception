# MariaDB Dockerfile
FROM mariadb:latest

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
# Expose port
EXPOSE 3306
