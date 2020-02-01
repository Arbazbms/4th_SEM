#include<stdio.h>
int linearSearch(int arr[65],int key,int n){
	int i;
	for(i=0;i<n;i++){
		if(arr[i] == key){
			return i;
		}
	}
	
	return -1;
	
}
void main(){

	int arr[65],key,i,n,flag;
	printf("Enter the Size of an array: ");
	scanf("%d",&n);
	printf("Enter the %d elements\n",n);
	for(i=0;i<n;i++){
		scanf("%d",&arr[i]);
	}
	printf("Enter the key : ");
	scanf("%d",&key);n
	
	flag = linearSearch(arr,key,n);

	if(flag!=-1){
			printf("Key %d found in index %d\n",key,flag);
	}
	else{
			printf("Key %d not found\n",key);
		}
	return;
}
