/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shaas <shaas@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/02/02 03:21:01 by shaas             #+#    #+#             */
/*   Updated: 2022/02/10 14:17:43 by shaas            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "minitalk.h"

// 1 = 0, 2 = 1

t_char	c;

__sighandler_t	receive_zero(void)
{
	c.i--;
	return (NULL);
}

__sighandler_t	receive_one(void)
{
	c.c = c.c + (1 << c.i);
	c.i--;
	return (NULL);
}

int	main(void)
{
	ft_putnbr_fd(getpid(), 1);
	ft_putchar_fd('\n', 1);
	c.c = 0;
	c.i = 7;
	signal(SIGUSR1, receive_zero);
	signal(SIGUSR2, receive_one);
	while (1)
	{
		if (c.i < 0)
		{
			ft_putchar_fd(c.c, 1);
			c.c = 0;
			c.i = 7;
		}
	}
}