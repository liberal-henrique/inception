CC			=	c++
CFLAGS		=	-Wall -Wextra -Werror -std=c++98
RM			=	/bin/rm -f
NAME		=	

SRCS		=	main.cpp ScalarConvert.cpp

all: $(NAME)

OBJS = $(SRCS:.cpp=.o)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.cpp
	$(CC) $(CFLAGS) -c -o $@ $<

build-service1:
    docker build -t service1-image ./service1

build-service2:
    docker build -t service2-image ./service2

run-compose:
	docker-compose up --build

stop-compose:
    docker-compose down

clean:
		$(RM) $(OBJS)

fclean: clean
		$(RM) $(NAME)

re: fclean all

.PHONY: all re clean fclean m


