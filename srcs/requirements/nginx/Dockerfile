FROM debian:bullseye

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get install -y nginx && apt-get -y install openssl &&\
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl/

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout /etc/nginx/ssl/nginx-selfsigned.key \
-out /etc/nginx/ssl/nginx-selfsigned.crt \
-subj "/C=PT/L=Lisbon/O=42/OU=student/CN=lliberal.42.fr"

COPY nginx.conf /etc/nginx/conf.d

# Expose ports
#EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]