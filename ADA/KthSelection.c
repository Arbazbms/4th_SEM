#include<stdio.h>
#include<stdlib.h>
void klargest (int arr[],int n,int k)
{
	int temp;
	for(int i=0;i<k;i++)
	{
 	for(int j=0;j<n-i-1;j++)
	{
 	if(arr[j]>arr[j+1])
	{
		temp=arr[j];
		arr[j]=arr[j+1];
		arr[j+1]=temp;
	}
}
}
printf("\n%d th largest element in array is %d",k,arr[n-k]);
}
void main()
{
	int n,k,arr[50];
	printf("Enter array size");
 	scanf("%d",&n);
	printf("Enter value of k:");
 	scanf("%d",&k);
 	printf("\nEnter elements in array");
 	for(int i=0;i<n;i++)
 	{
  		scanf("%d",&arr[i]);
  	}
	klargest(arr,n,k);
   return;
}

