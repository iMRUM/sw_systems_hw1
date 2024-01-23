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
    printf("%d",isPrime(i));
}
printf("\n");
for(int i=min+1; i<max; i++){
    printf("%d",isArmstrong(i));
}
printf("\n");
for(int i=min+1; i<max; i++){
 printf("%d",isStrong(i));
}
printf("\n");
for(int i=min+1; i<max; i++){
 printf("%d",isPalindrome(i));
} 
}