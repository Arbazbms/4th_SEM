/*Program To Find The GCD Of Two Numbers Using Mod Approach.*/	
	#include<stdio.h>
	
	int gcd(int m,int n)
	{
		if(n == 0)
		return m;
		else
		return gcd(n,m%n);
	}
	
	int  main()
	{
		int m,n;
		printf("\nEnter Two Positive Integers : \n");
		scanf("%d%d",&m,&n);
		printf("\nGCD Of %d & %d is %d.\n",m,n,gcd(m,n));
		return 0;
	}
	
	
