NAME = inception

all:		$(NAME)

$(NAME):
		@ sudo chmod 777 /etc/hosts
		@ sudo echo "127.0.0.1 dchheang.42.fr" >> /etc/hosts
		docker-compose -f srcs/docker-compose.yml up -- build

clean:
		docker system prune -f

re:		clean all

.PHONY:		all clean re
