# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clundber < clundber@student.hive.fi>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/24 10:58:29 by clundber          #+#    #+#              #
#    Updated: 2025/03/03 15:00:41 by clundber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m

# ------------ PROJECT -------#
name = inception

.DEFAULT_GOAL = all

#------------- COMMANDS ------#

env:
	./make_env.sh

ssl:
	mkcert -key-file srcs/requirements/nginx/tools/clundber.42.fr.key -cert-file srcs/requirements/nginx/tools/clundber.42.fr.crt https://clundber.42.fr

all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	
down:
	@docker-compose -f ./srcs/docker-compose.yml down

.PHONY: all down