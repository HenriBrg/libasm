/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: henri <henri@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/12/28 00:36:14 by henri             #+#    #+#             */
/*   Updated: 2019/12/28 00:37:39 by henri            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "./includes/libtfasm.h"

int	main(int ac, char **av)
{
	(void)ac;
	(void)av;

	printf("-------------------------- ft_strlen -------------------------------\n");
	char	*strlenTestNull = NULL;
	char	strlenTest[10] = "Assembly";
	printf("1) \"Assembly\" : %zu\n", ft_strlen(strlenTest));
	printf("2) \" \"        : %zu\n", ft_strlen(strlenTestNull));


	printf("-------------------------- ft_strcpy -------------------------------\n");
	char	d[6];
	char	s[6] = "Hello";
	ft_strcpy(d, s);
	printf("1) Src          : %s\n", s);
	printf("1) Src into Dst	: %s\n", d);

	printf("-------------------------- ft_strdup -------------------------------\n");
	char	*sdup;
	char	*src = "Hello";
	sdup = ft_strdup(src);
	printf("1) Malloc : %s\n", sdup);

	printf("-------------------------- ft_strcmp -------------------------------\n");
	char s1cmp[10] = "Hello";
	char s2cmp[10] = "Hello";
	char s3cmp[10] = "World";
	printf("1) ft_strcmp return : %d\n", ft_strcmp(s1cmp, s2cmp));
	printf("2) ft_strcmp return : %d\n", ft_strcmp(s1cmp, s3cmp));
	printf("1) strcmp    return : %d\n", strcmp(s1cmp, s2cmp));
	printf("2) strcmp    return : %d\n", strcmp(s1cmp, s3cmp));

	printf("-------------------------- ft_write  -------------------------------\n");
	int fd;
	int retWrite;
	char	strwrited[15] = "Assembly Nasm\n";

	fd = open("readWriteFile", O_RDWR);
	retWrite = ft_write(fd, "Assembly Nasm\n", 14);
	printf("1) With ft_write(fd, \"Assembly Nasm\", 14)\n");
	printf("1) Return value = %d\n", retWrite);
	close(fd);

	printf("-------------------------- ft_read  --------------------------------\n");
	int retRead;
	char b[10];
	fd = open("readWriteFile", O_RDONLY);
	retRead = ft_read(fd, b, 10);
	b[10] = '\0';
	printf("1) With \"retRead = ft_read(fd, b, 10)\"\n");
	printf("1) Read Return value = %d\n1) You read = %s\n", retRead, b);
	close(fd);

	int retBadRead;
	char bad[10];
	retBadRead = ft_read(-2, bad, 10);
	bad[10] = '\0';
	printf("\n2) With \"retBadRead = ft_read(-2, bad, 10)\"\n");
	printf("2) Read Return value = %d\n2) You read = %s\n", retBadRead, bad);
	close(fd);

	return (0);
}
