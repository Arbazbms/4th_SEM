#include<stdio.h>
#include<time.h>
#include<stdlib.h>

int RecursiveBsearch(int A[], int start, int end, int element) {
   if(start>end) return -1;
     int mid = (start+end)/2;
   if( A[mid] == element ) return mid;
   else if( element < A[mid] )
      RecursiveBsearch(A, start, mid-1, element);
   else
      RecursiveBsearch(A, mid+1, end, element);
      
      return -1;
}
int main() {
   int arr[20000],n,i,x;
   int f,l;
   clock_t start, end;
   int res;
   double time_required;
   printf("Enter the size of an array: ");
   scanf("%d",&n);
   printf("Enter %d elements\n",n);
   for(i=0;i<n;i++){
   	scanf("%d",&arr[i]);
   }
   printf("Enter the key: ");
   scanf("%d",&x);
   start = 0;
   end = n-1;
     start = clock();
	res = RecursiveBsearch(arr,f,l,x);
     end = clock();
     
     time_required = ((double) (end - start)) / CLOCKS_PER_SEC;
	printf("Time required is: %f\n",time_required);
     if(res == -1){
   	printf("%d is found \n",x);  
     }
     else{
    	printf("not found\n"); 
   }
   return 0;
}
