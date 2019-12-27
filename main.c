#include "./includes/libtfasm.h"

int	main(int ac, char **av)
{
	(void)ac;
	(void)av;


	// -------------------------------------------------------------------------
	char	d[6];
	char	s[6] = "Hello";
	ft_strcpy(d, s);
	printf("Src : %s\n", s);
	printf("Dst : %s\n", d);

	char	dd[6];
	char	ss[6] = "Hello";
	strcpy(dd, ss);
	printf("Official Src : %s\n", ss);
	printf("Official Dst : %s\n", dd);
	// -------------------------------------------------------------------------

	return (0);
}
