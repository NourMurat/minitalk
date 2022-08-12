/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   server.c                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: numussan <numussan@student.42abudhabi.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/07/20 15:31:42 by numussan          #+#    #+#             */
/*   Updated: 2022/08/06 19:07:02 by numussan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include "./libft/libft.h"

void    print(int *ar)
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
		if (ar[i] == 1)
			sum += a[i];
		i++;
	}
	c = sum;
	write(1, &c, 1);
}

void    sig_handler(int sgnl)
{
	static int	bits[8];
	static int	i;

	bits[i] = sgnl - 30;
	if (i == 7)
	{
		print(bits);
		i = 0;
		return;
	}
	i++;
}

int main(void)
{
	printf("PID of Server: %d\n", getpid());
	signal(SIGUSR1, sig_handler);
	signal(SIGUSR2, sig_handler);
	while (1)
		;
	return (0);
}