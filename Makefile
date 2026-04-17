NAME = asem

SRC = $(wildcard *.a)

OBJ = $(SRC:.a=.o)

LINKER = gcc

CC = as

FLAGS = -nostdlib -static

%.o : %.a
	echo compiling $<
	$(CC) $< -o $@

$(NAME): $(OBJ)
	$(LINKER) -o $(NAME) $(OBJ) $(FLAGS)

all: $(NAME)

clean:
	@rm -rf $(OBJ) 
fclean:
	@rm -rf $(NAME)
re: clean all

.PHONY: clean fclean re
