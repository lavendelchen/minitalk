/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shaas <shaas@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/02 03:21:01 by shaas             #+#    #+#             */
/*   Updated: 2022/02/10 20:00:41 by shaas            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

t_char	g_c;

void	receive(int sig)
{
	if (sig == SIGUSR2)
		g_c.c = g_c.c + (1 << g_c.i);
	g_c.i--;
}

int	main(void)
{
	ft_putnbr_fd(getpid(), 1);
	ft_putchar_fd('\n', 1);
	g_c.c = 0;
	g_c.i = 7;
	signal(SIGUSR1, receive);
	signal(SIGUSR2, receive);
	while (1)
	{
		if (g_c.i < 0)
		{
			ft_putchar_fd(g_c.c, 1);
			g_c.c = 0;
			g_c.i = 7;
		}
	}
}
