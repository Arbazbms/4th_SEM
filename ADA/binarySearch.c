
/*  QUESTION



ANALYSIS AND DESIGN OF ALGORITHMS LAB

Week 0-Assignment

Problem:

Given an sorted array arr[] of N integers and a number K is given. The task is to check if the element K is present in the array or not.

Input:

First line of input contains number of testcases T. For each testcase, first line of input contains number of elements in the array and the number K separated by space. Next line contains N elements.

Output:

For each testcase, if the element is present in the array print "1" (without quotes), else print "-1" (without quotes).

Example:

Input:

2

5 6

1 2 3 4 6

5 2

1 3 4 5 6

Output:

1

-1

Explanation:

Testcase 1: Since, 6 is present in the array at index 4 (0-based indexing), so output is 1.

Testcase 2: Since, 2 is not present in the array, so output is -1.



*/



/*    PROGRAM     */

#include<stdio.h>

int binarySearch(int arr[100],int first,int last,int key){

	
	
	while(first<=last){
	
	  int m = (first + last)/ 2; 

      
        if (arr[m] == key) 
            return 1; 
  
        
        if (arr[m] < key) 
            first = m + 1; 
  
       
        else
            last = m - 1; 
    } 
  
   
    return -1; 
		
}

void main()
{
	int arr[100],n,i,element;
	int first,last,result[10],t,j;
	printf("Enter the Number of TestCases");
	scanf("%d",&t);
	
	for(j=0;j<t;j++){
	
	printf("Enter the number of elements for arr %d\n",j);
	scanf("%d",&n);
	
	for(i= 0;i<n;i++){
		scanf("%d",&arr[i]);
	}
	
	printf("Enter the value to be searched: ");
	scanf("%d",&element);
	
	first = 0;
	last = n-1;
	
	result[j] = binarySearch(arr,first,last,element);
	
	
		
	}
	
	for(i=0;i<t;i++)
		printf("%d",result[i]);
	
}






