#include<stdio.h> 
int max(int a, int b) { return (a > b)? a : b; } 
int knapSack(int W, int wt[], int val[], int n) 
{ 
   int i, w; 
   int K[n+1][W+1]; 
   for (i = 0; i <= n; i++) 
   { 
       for (w = 0; w <= W; w++) 
       { 
           if (i==0 || w==0) 
               K[i][w] = 0; 
           else if (wt[i-1] <= w) 
                 K[i][w] = max(val[i-1] + K[i-1][w-wt[i-1]],  K[i-1][w]); 
           else
                 K[i][w] = K[i-1][w]; 
       } 
   } 
 return K[n][W]; 
} 
void main() 
{ 
	int i;
    int val[4]; 
    int wt[4]; 
    int  W; 
    int n = sizeof(val)/sizeof(val[0]); 
    printf("Enter the size of the bag\n");
    scanf("%d",&n);
    printf("Enter ths capacity of the bag\n");
    scanf("%d",&W);
    printf("Enter the values:\n");
    for(i=0;i<n;i++)
    {
    scanf("%d",&val[i]);
    }
    printf("Enter the weights:\n");
    for(i=0;i<n;i++)
    {
    	scanf("%d",&wt[i]);
	}
	printf("The solution of the knapsack problem is : %d", knapSack(W, wt, val, n)); 
    return; 
} 
