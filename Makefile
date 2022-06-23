NAME =		inception

all:		$(NAME)

$(NAME):
		sudo mkdir -p /home/dchheang/data
		docker-compose -f srcs/docker-compose.yml up --build

install:
		@ sudo chmod 777 /etc/hosts
		@ sudo echo "127.0.0.1 dchheang.42.fr" >> /etc/hosts
		@ sudo service nginx stop
		@ sudo service mysql stop

stop:
		docker-compose -f srcs/docker-compose.yml down

clean:		stop
		@ sudo rm -rf /home/dchheang
		docker system prune -f

re:		clean all

.PHONY:		all clean re
