# MariaDB Dockerfile
FROM debian:11.7

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install mariadb-server

#Copy custom MariaDB configuration 
COPY conf.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY script.sh .

RUN chmod 755 ./script.sh

RUN mysql_install_db

# Expose port
EXPOSE 3306

ENTRYPOINT [ "./script.sh" ]
