/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   client_bonus.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: numussan <numussan@student.42abudhabi.a    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/15 21:58:48 by numussan          #+#    #+#             */
/*   Updated: 2022/08/24 00:00:03 by numussan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <signal.h>
#include "./libft/libft.h"

static void	ft_send_bin(char c, pid_t pid)
{
	int	i;

	i = 0;
	while (i <= 7)
	{
		if ((c & 1) == 1)
			kill(pid, 31);
		else
			kill(pid, 30);
		c = c >> 1;
		i++;
		usleep(100);
	}
}

static int	ft_check_errors(int argc, char **argv)
{
	int	i;

	i = 0;
	if (argc != 3)
		return (1);
	while (argv[1][i])
	{
		if (!ft_isdigit(argv[1][i]))
			return (1);
		i++;
	}
	return (0);
}

int	main(int argc, char **argv)
{
	pid_t	pid;
	int		i;

	i = 0;
	ft_check_errors(argc, argv);
	pid = ft_atoi(argv[1]);
	if (pid <= 0)
		return (1);
	while (argv[2][i])
	{
		ft_send_bin(argv[2][i], pid);
		i++;
	}
	return (0);
}
