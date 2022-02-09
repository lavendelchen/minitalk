/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shaas <shaas@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/02 03:20:56 by shaas             #+#    #+#             */
/*   Updated: 2022/02/09 12:35:08 by shaas            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

void	error_check(int argc, char **argv)
{
	int	i;

	i = 0;
	if (argc != 3)
	{
		ft_putendl_fd("\e[31m\e[3mError:\e[0m Usage: ./client [PID] [message]", 1);
		exit(EXIT_FAILURE);
	}
	while (argv[1][i] != '\0')
	{
		if (ft_isdigit(argv[1][i]) == 0)
		{
			ft_putendl_fd("\e[31m\e[3mError:\e[0m PID must consist only of digits", 1);
			exit(EXIT_FAILURE);
		}
		i++;
	}
}

void	send_char(int c, pid_t pid)
{
	int	i;

	i = 7;
	while (i >= 0)
	{
		if ((c >> i) == 0)
		{
			kill(pid, SIGUSR1);
			printf("%d", (c >> i));
		}
		if ((c >> i) == 1)
		{
			kill(pid, SIGUSR2);
			printf("%d", (c >> i));
			c = c - (1 << i);
		}
		i--;
	}
	printf("\n");
}

int	main(int argc, char **argv)
{
	pid_t	pid;

	error_check(argc, argv);
	pid = ft_atoi(argv[1]);
	while (*argv[2] != '\0')
	{
		printf("%d\n", *argv[2]);
		send_char(*argv[2], pid);
		argv[2]++;
	}
}