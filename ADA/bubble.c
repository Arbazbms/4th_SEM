/*Sort a given set of N integer elements using Bubble Sort technique and compute its time taken.
Run the program for different values of N and record the time taken to sort.*/

#include<stdio.h>
#include<time.h>
#include<stdlib.h>

int bubble_sort(int arr[200000],int n){

	int i,j,temp;
	for(i=0;i<n-1;i++){
	
		for(j=0;j<n-i-1;j++)
		{
			if(arr[j] > arr[j+1]){
			
				int temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}
	
	}
}

void main()
{
	int i, arr[200000],n;
	clock_t start, end;
	double time_required;
	printf("Bubble Sort\n");
	printf("Enter the size of an array: \n");
	scanf("%d",&n);
	printf("Enter %d elements\n",n);
	for(i=0; i<n; i++)
	{
		arr[i] = rand() % 100000 + 1;
	}
	start = clock();
	bubble_sort(arr,n);
	end = clock();
	time_required = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Time required is: %f\n",time_required);
	
	for(i=0;i<n;i++){
	
		printf("%d\t",arr[i]);
	}
	
	return;
}











