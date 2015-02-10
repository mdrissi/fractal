#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: mdrissi <mdrissi@student.42.fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2014/04/27 22:08:40 by mdrissi           #+#    #+#              #
#    Updated: 2015/02/10 14:01:19 by mdrissi          ###   ########.fr        #
#                                                                              #
#******************************************************************************#

SRCDIR = srcs/
OBJDIR = objs/
LIBDIR = libft/

CC = gcc
CCFLAGS = -I includes -I $(LIBDIR)includes -Wall -Werror -Wextra
LDFLAGS = -L$(LIBDIR) -lft -L/usr/X11/lib -lXext -lX11 -lmlx

NAME = fractal
OBJ = main.o

SRCS = $(addprefix $(SRCDIR), $(OBJ:.o=.c))
OBJS = $(addprefix $(OBJDIR), $(OBJ))

all: do_lib $(NAME)

do_lib:
	@make -C $(LIBDIR)

$(NAME): $(OBJDIR) $(OBJS)
	$(CC) $(CCFLAGS) -o $(NAME) $(SRCS) $(LDFLAGS)

%.o: ../$(SRCDIR)%.c
	$(CC) $(CCFLAGS) -o $(@) -c $(^)

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	@make -C $(LIBDIR) clean
	rm -fr $(OBJDIR)

fclean: clean
	@make -C $(LIBDIR) fclean
	rm -f $(NAME)

re: fclean all
.PHONY: all re clean fclean