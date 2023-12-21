FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade
    
RUN apt-get -y install mariadb-server &&\
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

COPY script.sh .

RUN chmod 777 ./script.sh

RUN mysql_install_db
# Expose port
EXPOSE 3306

ENTRYPOINT [ "./script.sh" ]
