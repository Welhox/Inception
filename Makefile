# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clundber < clundber@student.hive.fi>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/24 10:58:29 by clundber          #+#    #+#              #
#    Updated: 2025/02/24 14:47:09 by clundber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m

# ------------ PROJECT -------#
NAME = inception

#------------- COMMANDS ------#

env:
	./make_env.sh

all:
	@docker-compose -f ./srcs/docker-compose.yml up -d --build
	
down:
	@docker-compose -f ./srcs/docker-compose.yml down

.PHONY: all down