# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: clundber < clundber@student.hive.fi>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/02/24 10:58:29 by clundber          #+#    #+#              #
#    Updated: 2025/02/24 11:03:25 by clundber         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
COLOUR_END=\033[0m

# ------------ PROJECT -------#
NAME = inception

#------------- COMMANDS ------#

all:
	@echo "$(COLOUR_BLUE)building $(NAME)$(COLOUR_END)"
	@docker-compose -f ./srcs/docker-compose.yml up -d --build 
	@echo "$(COLOUR_GREEN)$(NAME) built successfully$(COLOUR_END)"
	
down:
	@echo "$(COLOUR_GREEN)shutting down $(NAME)$(COLOUR_END)"
	@docker-compose -f ./srcs/docker-compose.yml down

.PHONY: all down