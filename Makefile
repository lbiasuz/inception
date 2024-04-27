
all: host_table volumes fix up

fix:
	sudo apt -y purge "^virtualbox-.*"
	sudo apt -y autoremove
	sudo apt -y install docker-compose-plugin

host_table:
	@if ! grep "lbiasuz.42.fr" /etc/hosts; then \
		sudo sed -i '2i\127.0.0.1\tlbiasuz.42.fr' /etc/hosts; \
	fi

volumes:
	@sudo mkdir -p /home/lbiasuz/data/html
	@sudo mkdir -p /home/lbiasuz/data/mysql

up:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

stop:
	@docker compose -f ./srcs/docker-compose.yml stop

clean:
	@docker volume rm srcs_mariadb
	@docker volume rm srcs_wordpress
	@sudo rm -rf /home/lbiasuz/data/mysql
	@sudo rm -rf /home/lbiasuz/data/html

fclean: clean
	docker system prune -af

re: down fclean all
