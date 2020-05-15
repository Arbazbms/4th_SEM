  
/********************************************************************************************************************
Write a program to implement
  a) Bubble Sort.
  b) Selection Sort.
Note: Two functions should be implemented in a single program, functions should be called based on input provided in switch case.
Also Calculate the Time taken To Sort 'n' Elements.
*******************************************************************************************************************/

#include <stdio.h>
#include <time.h>

/*C Function To Sort the Given Array Using Bubble Sort.*/
void Bubble_Sort(int A[],int n)
{
	int i,j;
	int temp;
	for(i=0;i<n-1;i++)
	{
		for(j=0;j<n-i-1;j++)
		{
			if(A[j]>A[j+1])
			{
				temp = A[j];
				A[j] = A[j+1];
				A[j+1] = temp;
			}
		}
	}
	printf("\nSorted Array Using Bubble Sort is : \n");
	for(i=0;i<n;i++)
	{
		printf("%d\n",A[i]);
	}
}

/*C Function To Sort The Given Array Using Selection Sort.*/
void Selection_Sort(int A[],int n)
{
	int i,j;
	int min,temp;
	for(i=0;i<n;i++)
	{
		min = i;
		for(j=i+1;j<n;j++)
		{
			if(A[min]>A[j])
			min = j;
		}
		temp = A[min];
		A[min] = A[i];
		A[i] = temp;
	}
	printf("\nSorted Array Using Selction Sort is : \n");
	for(i=0;i<n;i++)
	{
		printf("%d\n",A[i]);
	}
}

int main()
{
	int A[1000],i;
	int choice,n;
	clock_t start, end;
    	double time_required;
	printf("\nThe Choices Are : \n");
	printf("\n1. Bubble Sort.\n2.Selection Sort.\n\nEnter Your Choice : ");
	scanf("%d",&choice);
	
	switch(choice)
	{
		case 1 : printf("\nEnter The Size Of Array : ");
				 scanf("%d",&n);
				 printf("\nEnter %d Elements : \n",n);
				 for(i=0;i<n;i++)
				 {
				 	scanf("%d",&A[i]);
				 }
				 start = clock();
					 Bubble_Sort(A,n);     
			     	 end = clock();
     			 	 time_required = ((double) (end - start)) / CLOCKS_PER_SEC;
     			 	 printf("\nTime Taken For Sorting %d Elements is : %f\n",n,time_required);
				 break;
				 
		case 2 : printf("\nEnter The Size Of Array : ");
				 scanf("%d",&n);
				 printf("\nEnter %d Elements : \n",n);
				 for(i=0;i<n;i++)
				 {
				 	scanf("%d",&A[i]);
				 }
				 start = clock();
					 Selection_Sort(A,n);     
			     	 end = clock();
     			 	 time_required = ((double) (end - start)) / CLOCKS_PER_SEC;
     			 	 printf("\nTime Taken For Sorting %d Elements is : %f\n",n,time_required);
				 break;
				 
		default : printf("\nInvalid Choice..!\n");				  
	}
	return 0;
}
