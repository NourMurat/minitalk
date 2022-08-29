/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: numussan <numussan@student.42abudhabi.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/15 21:57:57 by numussan          #+#    #+#             */
/*   Updated: 2022/08/24 00:03:55 by numussan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include "./libft/libft.h"
#include "./ft_printf/ft_printf.h"

void	ft_display_on_screen(int *bits)
{
	int		*a;
	int		i;
	int		sum;
	char	c;

	a = (int [8]){1, 2, 4, 8, 16, 32, 64, 128};
	sum = 0;
	i = 0;
	while (i < 8)
	{
		if (bits[i] == 1)
			sum += a[i];
		i++;
	}
	c = sum;
	write(1, &c, 1);
}

void	ft_sig_handler(int sgnl)
{
	static int	bits[8];
	static int	i;

	bits[i] = sgnl - 30;
	if (i == 7)
	{
		ft_display_on_screen(bits);
		i = 0;
		return ;
	}
	i++;
}

int	main(void)
{
	ft_printf("PID of Server: %d\n", getpid());
	signal(SIGUSR1, ft_sig_handler);
	signal(SIGUSR2, ft_sig_handler);
	while (1)
		;
	return (0);
}
