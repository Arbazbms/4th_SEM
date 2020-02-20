/*String matching using brute force technique*/

#include<stdio.h>
#include<string.h>

int stringMatching(char t[100],char p[100]){
	int i,j,flag=0;
	int n = strlen(t);
	int m = strlen(p);
	for(i=0;i<=n-m;i++){
		j=0;
		while(j<m && t[i+j] == p[j]){
		
			j++;
		}
		if(j==m){
			flag = 1;
			return i;
		}

	}
		
	if(flag == 0)
		return -1;
}



void main(){

	int pos;
	char t[100],p[100];
	printf("Enter the Text String: \n");
	scanf("%s",t);
	printf("Enter the pattern String: \n");
	scanf("%s",p);
	pos = stringMatching(t,p);
	if(pos == -1){
		printf("Not found!!\n");
	}
	else{
		printf("Found at %d postion\n",pos);
	}
	return;	
}



