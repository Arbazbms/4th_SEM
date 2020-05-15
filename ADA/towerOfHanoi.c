/*Program To Solve The Tower Of Hannoi Puzzle.*/

	#include<stdio.h>
	
	void tower_of_Hannoi(int n,char source,char dest,char aux)
	{
		if(n == 1)
		{
			printf("\nMove Disk-1 from Peg %c Peg To %c",source,dest);
			return;
		}
		tower_of_Hannoi(n-1,source,aux,dest);
		printf("\nMove Disk-%d From Peg %c To Peg %c",n,source,dest);
		tower_of_Hannoi(n-1,aux,dest,source);
	}
	
	int main()
	{
		int n=3;
		tower_of_Hannoi(n,'A','C','B');
		return 0;
	}
