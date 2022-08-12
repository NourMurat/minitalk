# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: numussan <numussan@student.42abudhabi.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/20 15:33:15 by numussan          #+#    #+#              #
#    Updated: 2022/08/06 19:39:53 by numussan         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME			=	server

SERVER_SRC		=	server.c

CLIENT_SRC		=	client.c

SERVER_OBJS		=	$(SERVER_SRC:.c=.o)

CLIENT_OBJS		=	$(CLIENT_SRC:.c=.o)

OBJS			=	$(CLIENT_OBJS) $(SERVER_OBJS)

SERVER_SRC_B	=	server_bonus.c

CLIENT_SRC_B	=	client_bonus.c

SERVER_OBJS_B	=	$(SERVER_SRC_B:.c=.o)

CLIENT_OBJS_B	=	$(CLIENT_SRC_B:.c=.o)

OBJS_B			=	$(CLIENT_OBJS_B) $(SERVER_OBJS_B)

CCF				=	gcc -Wall -Wextra -Werror

RM				=	rm -rf

SERVER_NAME		=	server

CLIENT_NAME		=	client

SERVER_NAME_B	=	server_bonus

CLIENT_NAME_B	=	client_bonus

LIBFT			=	cd libft && make

LIB				=	libft/libft.a


all: $(NAME)

$(NAME): connecting_libft server_startup client_launch

bonus: comp_start ft_server_bonus ft_client_bonus

connecting_libft:
	@$(LIBFT)

server_startup: $(SERVER_OBJS)
	@$(CCF) $(SERVER_OBJS) $(LIB) -o $(SERVER_NAME)

client_launch: $(CLIENT_OBJS)
	@$(CCF) $(CLIENT_OBJS) $(LIB) -o $(CLIENT_NAME)

ft_server_bonus: $(SERVER_OBJS_B)
	@$(CCF) $(SERVER_OBJS_B) $(LIB) -o $(SERVER_NAME_B)

ft_client_bonus: $(CLIENT_OBJS_B)
	@$(CCF) $(CLIENT_OBJS_B) $(LIB) -o $(CLIENT_NAME_B)

clean:
	@$(RM) $(OBJS)
	@$(RM) $(OBJS_B)
	@cd libft && make clean

fclean: clean
	@$(RM) $(SERVER_NAME) $(CLIENT_NAME)
	@$(RM) $(SERVER_NAME_B) $(CLIENT_NAME_B)
	@cd libft && make fclean

.c.o:
	@$(CCF) -I include -c $< -o ${<:.c=.o}

re:	fclean all

.PHONY: all server client clean fclean re libft