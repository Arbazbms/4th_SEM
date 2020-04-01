/* Sort a Given set of N integers Using Insertion Sort Technique & Compute its Time Taken....*/

#include<stdio.h>
#include<stdlib.h>
#include<time.h>

void Insertion_Sort(int A[],int n)
{
	int i,j,key;
	for(i=1;i<n;i++)
	{
		key = A[i];
		j = i-1;
		
		while(j>=0 && A[j]>key)
		{
			A[j+1] = A[j];
			j = j-1;
		}
		A[j+1] = key;
	}
}

int main()
{
	int A[1000000],i,n;
	clock_t start,end;
	double time_required;
	printf("\nEnter The Size of Array : ");
	scanf("%d",&n);
	for(i=0;i<n;i++)
	{
		A[i] = rand() % 10000+1;
	}
	/*printf("\nElements in The Array : \n");
	for(i=0;i<n;i++)
	{
		printf("%d\t",A[i]);
	}*/
	start = clock();
		Insertion_Sort(A,n);
	end = clock();
	time_required =	((double)(end-start))/CLOCKS_PER_SEC;
	/*printf("\nSorted Elements : \n");
	for(i=0;i<n;i++)
	{
		printf("%d\t",A[i]);
	}*/
	printf("\nTime Required To Sort %d Elements is : %f \n ",n,time_required); 
}
