# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jodufour <jodufour@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/19 22:37:10 by jodufour          #+#    #+#              #
#    Updated: 2021/04/19 23:59:57 by jodufour         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	game_of_life
CC		=	gcc -c -o
LINKER	=	gcc -o
RM		=	rm -rf
MAKEDIR	=	mkdir -p

INCLUDE	=	includes
SRCD	=	srcs/
OBJD	=	objs/

SRCS	=	\
			main.c			\
			gol_atoi.c		\
			gol_setup.c		\
			gol_pause.c		\
			gol_ret_msg.c	\
			gol_run_game.c

OBJS	:=	${SRCS:.c=.o}
OBJS	:=	${addprefix ${OBJD},${OBJS}}
DEPS	=	${OBJS:.o=.d}

CFLAGS	=	-Wall -Wextra -MMD -I ${INCLUDE}

LDFLAGS	=	-lncurses

${NAME}:	${OBJS}
	${LINKER} $@ ${LDFLAGS} $^

all:	${NAME}

-include ${DEPS}

${OBJD}%.o:	${SRCD}%.c
	@${MAKEDIR} ${OBJD}
	${CC} $@ ${CFLAGS} $<

clean:
	${RM} ${OBJD}

fclean:
	${RM} ${OBJD} ${NAME}

re:	fclean all

.PHONY:	all, clean, fclean, re