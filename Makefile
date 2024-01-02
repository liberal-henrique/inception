DOCKERFILE = srcs/docker-compose.yml
CMD	= docker compose -f $(DOCKERFILE)

build:
	@if [ ! -d  "/home/lliberal42/data" ]; then \
		mkdir /home/lliberal42/data /home/lliberal42/data/wordpress /home/lliberal42/data/mariadb; \
	fi
	$(CMD) build

up: build
		$(CMD) up

down:
		$(CMD) down --volume --rmi all

prune: down
		docker system prune -f

clean:
	@if [ -d  "/home/lliberal42/data" ]; then \
		sudo rm -rf /home/lliberal42/data; \
	fi

extraclean: down prune clean


#docker compose build
#docker compose up
#docker exec -it mariadb bash
#
#docker ps
#
#docker compose down --volume --rmi all
#docker system prune -a


# mysql -u root
# show databases;
# use qualquercoisa;
# show tables;
