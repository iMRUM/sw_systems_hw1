#include "NumClass.h"
#include <stdio.h>
int main(){
  int number1;
  int number2;
  int max;
  int min;
  scanf("%d %d" ,&number1,&number2);
  if(number1>=number2){
  max=number1; min=number2;
  }else{
 max=number2; min=number1;
  }
for(int i=min+1; i<max; i++){
	if(isPrime(i)){
		printf("%d",i);
	}
}
printf("\n");
for(int i=min+1; i<max; i++){
    if(isArmstrong(i)){
		printf("%d",i);
	}
}
printf("\n");
for(int i=min+1; i<max; i++){
 if(isStrong(i)){
		printf("%d",i);
	}
}
printf("\n");
for(int i=min+1; i<max; i++){
 if(isPalindrome(i)){
		printf("%d",i);
	}
} 
}
