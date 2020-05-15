  
/*Program To Find The Greatest Common Divisor of Two Positive Integers Using Repeatative Subraction Method.*/\

	#include<stdio.h>
	
	//Recursive C Function To Compute GCD. 
	int gcd(int m,int n)
	{
		if(m==0)
			return n;
		if(n==0)	
			return m;
		if(m==n)	
			return m;
		if(m>n)
			return gcd(m-n,n);
		return gcd(m,n-m);
	}
	
	int main()
	{
		int m,n;
		printf("\nEnter Two positive Integers : \n ");
		scanf("%d%d",&m,&n);
		printf("\nGCD of %d & %d is %d.\n",m,n,gcd(m,n));
		return 0;
	}
