NAME = libftasm.a

SRCS = srcs/ft_strlen.s srcs/ft_strcpy.s  srcs/ft_strdup.s  				   \
	   srcs/ft_strcmp.s srcs/ft_write.s srcs/ft_read.s

OBJS = ${SRCS:.s=.o}

# Pour un seul programme
# nasm -f macho64 minima.s -o minima.o
# ld minima.o -macosx_version_min 10.8 -lSystem

# ifndef VERBOSE
# .SILENT:
# endif

all: $(NAME)

.s.o:
	nasm -f macho64 $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re
