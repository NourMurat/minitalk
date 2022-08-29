# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: numussan <numussan@student.42abudhabi.a    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/07/20 15:33:15 by numussan          #+#    #+#              #
#    Updated: 2022/08/20 23:32:33 by numussan         ###   ########.fr        #
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

LIBFT			=	cd libft && make
PRINTF			=	cd ft_printf && make

LIB1			=	libft/libft.a
LIB2			=	ft_printf/libftprintf.a


all: $(NAME)

$(NAME): connecting_libft connecting_printf server_startup client_launch

bonus: connecting_libft connecting_printf server_bonus_startup client_bonus_launch

connecting_libft:
	@$(LIBFT)

connecting_printf:
	@$(PRINTF)

server_startup: $(SERVER_OBJS)
	@$(CCF) $(SERVER_OBJS) $(LIB1) $(LIB2) -o server

client_launch: $(CLIENT_OBJS)
	@$(CCF) $(CLIENT_OBJS) $(LIB1) -o client

server_bonus_startup: $(SERVER_OBJS_B)
	@$(CCF) $(SERVER_OBJS_B) $(LIB1) $(LIB2) -o server_bonus

client_bonus_launch: $(CLIENT_OBJS_B)
	@$(CCF) $(CLIENT_OBJS_B) $(LIB1) -o client_bonus

clean:
	@$(RM) $(OBJS)
	@$(RM) $(OBJS_B)
	@$(LIBFT) clean
	@$(PRINTF) clean

fclean: clean
	@$(RM) server client
	@$(RM) server_bonus client_bonus
	@$(LIBFT) fclean
	@$(PRINTF) fclean

.c.o:
	@$(CCF) -I include -c $< -o ${<:.c=.o}

re:	fclean all

.PHONY: all server client clean fclean re libft