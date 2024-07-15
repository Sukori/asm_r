NAME	= hello
AC	= nasm
DEBUG	= -g
LD	= ld
FLAGS	= -f elf64
SRCS	= main.asm \
	itoa.asm
OBJS	= $(SRCS:.asm=.o)

all: $(NAME)

$(NAME): $(OBJS)
	$(LD) $(OBJS) -o $(NAME)

%.o: %.asm
	$(AC) $(DEBUG) $(FLAGS) $< -o $@

run: $(NAME)
	./$(NAME)

clean:
	rm -f $(NAME) $(OBJS)

.PHONY: all run clean
