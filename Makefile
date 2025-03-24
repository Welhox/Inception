# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: casimirri <clundber@student.hive.fi>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/24 10:58:29 by clundber          #+#    #+#              #
#    Updated: 2025/03/24 14:36:08 by casimirri        ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m

# ------------ PROJECT -------#
name = inception

.DEFAULT_GOAL = all

#------------- COMMANDS ------#

all: check-env check-ssl
	@bash srcs/requirements/mariadb/tools/make_dirs.sh
	@docker compose -f ./srcs/docker-compose.yml up -d --build

check-env:
	@if [ ! -f srcs/.env ]; then \
		echo "$(COLOUR_RED)Error: .env file is missing! Run 'make env' to create it.$(COLOUR_END)"; \
		exit 1; \
	fi

check-ssl:
	@if [ ! -f srcs/requirements/nginx/tools/clundber.42.fr.crt ] || [ ! -f srcs/requirements/nginx/tools/clundber.42.fr.key ]; then \
		echo "$(COLOUR_RED)Error: SSL certificate or key is missing! Run 'make ssl' to generate them.$(COLOUR_END)"; \
		exit 1; \
	fi

env:
	./make_env.sh

ssl:
	mkcert -key-file srcs/requirements/nginx/tools/clundber.42.fr.key -cert-file srcs/requirements/nginx/tools/clundber.42.fr.crt https://clundber.42.fr
	
down:
	@docker compose -f ./srcs/docker-compose.yml down

fclean: down
	@printf "Clean of all docker configs\n"
	@docker system prune --all
	@sudo rm -rf ~/data

.PHONY: all down check-env check-ssl
