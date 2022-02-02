# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: shaas <shaas@student.42.fr>                +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/02 03:19:12 by shaas             #+#    #+#              #
#    Updated: 2022/02/02 03:30:28 by shaas            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# defines #
NAME := minitalk

SRC := server.c client.c

OBJ := $(SRC:.c=.o)

COMP := gcc -Wall -Wextra -Werror

PRINT_SYSTEM = 0

#LIBFT_DIR := libft

#LIBFT = $(LIBFT_DIR)/libft.a

# check if mac or linux #
OS := $(shell uname)

# rules #
all: $(NAME)

%.o: %.c
	$(COMP1) $< -o $@

$(NAME): $(OBJ) #$(LIBFT)
	@printf $(YELLOW)"*--------object files created!---------*\n\n"$(RESET)
	$(COMP2)
	@printf $(LIGHTGREEN)"*--------executable created!-----------*\n\n"$(RESET)

# print out which system we're on, will only be executed once \
	even if called multiple times
ifeq ($(PRINT_SYSTEM), 0)
print_system:
	$(eval PRINT_SYSTEM = 1)
	@printf $(DARKGRAY)$(ITALIC)$(UNDERLINED)"We're on $(OS)\n\n"$(RESET)
endif

# rule for running program
exec: print_system
	@printf $(MAGENTA)"*--------executing program!------------*\n\n"$(RESET)
	./$(NAME) $(MAP)

# complies & runs immediately
both: $(NAME) exec

$(LIBFT): print_system
	@printf $(LIGHTBLUE)"\n*--------checking libft...-------------*\n"$(RESET)
	@make -C $(LIBFT_DIR)

clean: print_system
	rm -fr $(OBJ)
	@printf $(RED)"*--------object files removed!---------*\n\n"$(RESET)

fclean: clean
	rm -fr $(NAME)
	@printf $(RED)"*--------$(NAME) removed!--------------*\n\n"$(RESET)

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
