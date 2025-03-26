# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: casimirri <clundber@student.hive.fi>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/24 10:58:29 by clundber          #+#    #+#              #
#    Updated: 2025/03/26 11:17:59 by casimirri        ###   ########.fr        #
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
	@if [ -f srcs/.env ]; then \
		DOMAIN_NAME=$$(grep '^DOMAIN_NAME=' srcs/.env | cut -d '=' -f2); \
		if [ ! -f srcs/requirements/nginx/tools/$${DOMAIN_NAME}.crt ] || [ ! -f srcs/requirements/nginx/tools/$${DOMAIN_NAME}.key ]; then \
			echo "$(COLOUR_RED)Error: SSL certificate or key is missing! Run 'make ssl' to generate them.$(COLOUR_END)"; \
			exit 1; \
		fi \
	else \
		echo "$(COLOUR_RED)Error: .env file not found!$(COLOUR_END)"; \
		exit 1; \
	fi


env:
	./make_env.sh

ssl:
	@if [ -f srcs/.env ]; then \
		DOMAIN_NAME=$$(grep '^DOMAIN_NAME=' srcs/.env | cut -d '=' -f2); \
		mkcert -key-file srcs/requirements/nginx/tools/$${DOMAIN_NAME}.key -cert-file srcs/requirements/nginx/tools/$${DOMAIN_NAME}.crt https://$${DOMAIN_NAME}; \
	else \
		echo "$(COLOUR_RED)Error: .env file not found!$(COLOUR_END)"; \
		exit 1; \
	fi

down:
	@docker compose -f ./srcs/docker-compose.yml down

fclean: down
	@printf "Clean of all docker configs\n"
	@docker system prune --all
	@sudo rm -rf ~/data

.PHONY: all down check-env check-ssl
