NAME = libfts.a

SRCS = srcs/ft_isalpha.s srcs/ft_isdigit.s srcs/ft_isalnum.s \
			 srcs/ft_isascii.s srcs/ft_isprint.s srcs/ft_tolower.s \
			 srcs/ft_toupper.s srcs/ft_bzero.s   srcs/ft_strcat.s	 \
			 srcs/ft_strlen.s  srcs/ft_puts.s    srcs/ft_memset.s	 \
			 srcs/ft_memcpy.s  srcs/ft_strdup.s  srcs/ft_cat.s

OBJS = ${SRCS:.s=.o}

# Pour un seul programme
# nasm -f macho64 minima.s -o minima.o
# ld minima.o -macosx_version_min 10.8 -lSystem

ifndef VERBOSE
.SILENT:
endif

all: $(NAME)

.s.o:
	nasm -f macho64 $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

run: $(NAME)
	gcc -Wall -Wextra -Werror  -L. libfts.a main.c
	./a.out

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
