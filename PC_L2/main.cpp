// Laboratory work #2
// Created by the student of CS-322(A)
// Dima Zui
// MA = MB * (MC *MK) + MM * s
// MT = MC * MK
// MX = MD * MT


#include <iostream>
#include <vector>
#include <random>
#include "omp.h"

constexpr int N = 4;
constexpr int P = 4;
constexpr int H = N / P;

int		generate_number(void);
void	mul_matrix_by_number(std::vector<std::vector<int>> &mat, int start, int end, int nb);
void	mul_matrix(const std::vector<std::vector<int>> &mat_1, const std::vector<std::vector<int>> &mat_2,
	std::vector<std::vector<int>> &res, int start, int end);
void	add_matrix(const std::vector<std::vector<int>> &mat_1, const std::vector<std::vector<int>> &mat_2,
	std::vector<std::vector<int>> &res, int start, int end);
void	print_matrix(const std::vector<std::vector<int>> &mat);
void	assign_matrix(std::vector<std::vector<int>> &mat);

void	assign_matrix(std::vector<std::vector<int>> &mat)
{
	for (int i = 0; i < mat.size(); i++)
	{
		for (int j = 0; j < mat[i].size(); j++)
		{
			mat[i][j] = generate_number();
		}
	}
}


void	print_matrix(const std::vector<std::vector<int>> &mat)
{
	for (int i = 0; i < mat.size(); i++)
	{
		for (int j = 0; j < mat.size(); j++)
			std::cout << mat[i][j] << " ";
		std::cout << std::endl; 
	}
	std::cout << std::endl;
}

int		generate_number(void)
{
	std::random_device					rd;
	std::mt19937						gen(rd());
	std::uniform_int_distribution<>		generate_nb(0, 20);

	return (generate_nb(gen));
}

void	mul_matrix_by_number(std::vector<std::vector<int>> &mat, int start, int end, int nb)
{
	for (int i = 0; i < mat.size(); i++)
		for (int j = start; j < end; j++)
			mat[i][j] = mat[i][j] * nb;
}

void	mul_matrix(const std::vector<std::vector<int>> &mat_1, const std::vector<std::vector<int>> &mat_2,
	std::vector<std::vector<int>> &res, int start, int end)
{
	for (int i = 0; i < res.size(); i++)
	{
		for (int j = start; j < end; j++)
		{
			for (int k = 0; k < res.size(); k++)
				res[i][j] += mat_1[i][k] * mat_2[k][j];
		}
	}
}

void	add_matrix(const std::vector<std::vector<int>> &mat_1, const std::vector<std::vector<int>> &mat_2,
	std::vector<std::vector<int>> &res, int start, int end)
{
	for (int i = 0; i < res.size(); i++)
		for (int j = start; j < end; j++)
			res[i][j] = mat_1[i][j] + mat_2[i][j];
}

void 	reset_matrix(std::vector<std::vector<int>> &mat)
{
	for (int i = 0; i < mat.size(); i++)
		for (int j = 0; j < mat.size(); j++)
			mat[i][j] = 0;
}

void	default_matrix(std::vector<std::vector<int>> &mat)
{
	mat.clear();
	mat.resize(N, std::vector<int>(N, 0));
}

int	main(void)
{
	// creating matricies

	std::vector<std::vector<int>> 	MA;
	std::vector<std::vector<int>> 	MB;
	std::vector<std::vector<int>> 	MC;
	std::vector<std::vector<int>> 	MK;
	std::vector<std::vector<int>> 	MM;
	int 						 	s;

	// data for intermediate results storing

	std::vector<std::vector<int>> MT;
	std::vector<std::vector<int>> MX;

	// sets values of matrix to zero

	default_matrix(MA);
	default_matrix(MB);
	default_matrix(MC);
	default_matrix(MK);
	default_matrix(MM);
	default_matrix(MT);
	default_matrix(MX);

	// set the number of thread in a parallel region

	omp_set_num_threads(P);

	// inform OPEN_MP that the following code block is a parallel region
	// assigning of the matricies and number 's'

	#pragma omp parallel shared(MB, MC, s)
	{
		if (omp_get_thread_num() == 0)
		{
			// copies of shared resources

			std::vector<std::vector<int>> 	MB_COPY_1;
			std::vector<std::vector<int>> 	MC_COPY_1;
			int 							s_COPY_1;

			std::cout << "T1 started" << std::endl;
			
			// input of data

			assign_matrix(MB);
	
			#pragma omp barrier

			// copying of shared resources

			#pragma critical
			{
				MB_COPY_1 = MB;
				MC_COPY_1 = MC;
				s_COPY_1 = s;
			}

			mul_matrix(MC_COPY_1, MK, MT, 0, H);
			mul_matrix_by_number(MM, 0, H, s_COPY_1);

			#pragma omp barrier

			mul_matrix(MB_COPY_1, MT, MX, 0, H);

			#pragma omp barrier

			add_matrix(MX, MM, MA, 0, H);

			std::cout << "T1 FINISHED" << std::endl;

			#pragma omp barrier
		}

		if (omp_get_thread_num() == 1)
		{

			// copies of shared resources

			std::vector<std::vector<int>> 	MB_COPY_2;
			std::vector<std::vector<int>> 	MC_COPY_2;
			int 							s_COPY_2;

			std::cout << "T2 started" << std::endl;

			#pragma omp barrier

			// copying of shared resources

			#pragma critical
			{
				MB_COPY_2 = MB;
				MC_COPY_2 = MC;
				s_COPY_2 = s;
			}

			mul_matrix(MC_COPY_2, MK, MT, H, 2 * H);
			mul_matrix_by_number(MM, H, 2 * H, s_COPY_2);

			#pragma omp barrier			

			mul_matrix(MB_COPY_2, MT, MX, H, 2 * H);

			#pragma omp barrier

			add_matrix(MX, MM, MA, H, 2 * H);

			std::cout << "T2 FINISHED" << std::endl;

			#pragma omp barrier

			std::cout << std::endl;
			print_matrix(MA);
		}

		if (omp_get_thread_num() == 2)
		{

			// copies of shared resources

			std::vector<std::vector<int>> 	MB_COPY_3;
			std::vector<std::vector<int>> 	MC_COPY_3;
			int 							s_COPY_3;

			std::cout << "T3 started" << std::endl;
			
			// input of data

			assign_matrix(MK);
			assign_matrix(MM);

			#pragma omp barrier

			// copying of shared resources

			#pragma critical(cs_copy)
			{
				MB_COPY_3 = MB;
				MC_COPY_3 = MC;
				s_COPY_3 = s;
			}

			mul_matrix(MC_COPY_3, MK, MT, 2 * H, 3 * H);
			mul_matrix_by_number(MM, 2 * H, 3 * H, s_COPY_3);

			#pragma omp barrier

			mul_matrix(MB_COPY_3, MT, MX, 2 * H, 3 * H);

			#pragma omp barrier

			add_matrix(MX, MM, MA, 2 * H, 3 * H);

			std::cout << "T3 FINISHED" << std::endl;

			#pragma omp barrier				
		}

		if (omp_get_thread_num() == 3)
		{

			// copies of chared resources

			std::vector<std::vector<int>> 	MB_COPY_4;
			std::vector<std::vector<int>> 	MC_COPY_4;
			int 							s_COPY_4;

			std::cout << "T4 started" << std::endl;
			
			// input of data

			assign_matrix(MC);
			s = generate_number();

			#pragma omp barrier

			// copying of shared resources

			#pragma critical(cs_copy)
			{
				MB_COPY_4 = MB;
				MC_COPY_4 = MC;
				s_COPY_4 = s;
			}		

			mul_matrix(MC_COPY_4, MK, MT, 3 * H, 4 * H);
			mul_matrix_by_number(MM, 3 * H, 4 * H, s_COPY_4);

			#pragma omp barrier

			mul_matrix(MB_COPY_4, MT, MX, 3 * H, 4 * H);

			#pragma omp barrier

			add_matrix(MX, MM, MA, 3 * H, 4 * H);

			std::cout << "T4 FINISHED" << std::endl;

			#pragma omp barrier			

		}
	}

	// end of a parallel region

	return (0);
}
