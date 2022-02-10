# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: shaas <shaas@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 03:19:12 by shaas             #+#    #+#              #
#    Updated: 2022/02/10 20:02:41 by shaas            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# defines #
NAME := minitalk

CLIENT := client
SERVER := server

CLIENT_SRC := client.c
SERVER_SRC := server.c

CLIENT_OBJ := $(CLIENT_SRC:.c=.o)
SERVER_OBJ := $(SERVER_SRC:.c=.o)

LIBFT_DIR := libft

LIBFT = $(LIBFT_DIR)/libft.a

COMP := gcc -Wall -Wextra -Werror

INCLUDE := $(LIBFT_DIR)/libft.h

# rules #
all: $(NAME)

$(NAME): $(CLIENT) $(SERVER)

$(CLIENT): $(LIBFT) $(CLIENT_OBJ)
	$(COMP) $(CLIENT_OBJ) $(LIBFT) -o $(CLIENT)
	@printf $(CYAN)"*--------client compiled!--------------*\n"$(RESET)

$(SERVER): $(LIBFT) $(SERVER_OBJ)
	$(COMP) $(SERVER_OBJ) $(LIBFT) -o $(SERVER)
	@printf $(MAGENTA)"*--------server compiled!--------------*\n"$(RESET)

%.o: %.c
	$(COMP) -o $@ -c $<

# rule for running server
servexe:
	@printf $(MAGENTA)"*--------executing server!------------*\n"$(RESET)
	./$(SERVER)
	@printf "\n"

# compiles and runs server
both: $(NAME) servexe

$(LIBFT):
	@printf $(LIGHTBLUE)"\n*--------checking libft...-------------*\n"$(RESET)
	@make -C $(LIBFT_DIR)

clean:
	rm -fr $(OBJ)
	@printf $(RED)"*--------object files removed!---------*\n\n"$(RESET)

fclean: clean
	rm -fr $(CLIENT) $(SERVER)
	@printf $(RED)"*--------executables removed!---------*\n\n"$(RESET)

re: fclean all

# text modifiers #
RED = "\e[31m"

GREEN = "\e[32m"

YELLOW = "\e[33m"

BLUE = "\e[34m"

MAGENTA = "\e[35m"

CYAN = "\e[36m"

LIGHTGRAY = "\e[37m"

DARKGRAY = "\e[90m"

LIGHTRED = "\e[91m"

LIGHTGREEN = "\e[92m"

LIGHTYELLOW = "\e[93m"

LIGHTBLUE = "\e[94m"

LIGHTMAGENTA = "\e[95m"

LIGHTCYAN = "\e[96m"

RED_BG = "\e[41m"

GREEN_BG = "\e[42m"

YELLOW_BG = "\e[43m"

BLUE_BG = "\e[44m"

MAGENTA_BG = "\e[45m"

CYAN_BG = "\e[46m"

LIGHTGRAY_BG = "\e[47m"

DARKGRAY_BG = "\e[100m"

LIGHTRED_BG = "\e[101m"

LIGHTGREEN_BG = "\e[102m"

LIGHTYELLOW_BG = "\e[103m"

LIGHTBLUE_BG = "\e[104m"

LIGHTMAGENTA_BG = "\e[105m"

LIGHTCYAN_BG = "\e[106m"

BOLD = "\e[1m"

ITALIC = "\e[3m"

UNDERLINED = "\e[4m"

RESET = "\e[0m"
