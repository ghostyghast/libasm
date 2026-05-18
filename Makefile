NAME = asem

SRC = $(wildcard *.a)

OBJ = $(SRC:.a=.o)

LINKER = gcc

CC = nasm

ASSEMBLER_FLAGS = -f elf64

LINKER_FLAGS = -static -nostdlib

%.o : %.a
	echo compiling $<
	$(CC) $< -o $@ $(ASSEMBLER_FLAGS)

$(NAME): $(OBJ)
	$(LINKER) $(OBJ) -o $(NAME) $(LINKER_FLAGS)

all: $(NAME)

clean:
	@rm -rf $(OBJ) 
fclean: clean
	@rm -rf $(NAME) 
re: clean all 

.PHONY: clean fclean re
