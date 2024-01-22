#include <stdio.h>
#include "NumClass.h"

int isPalindrome(int  a){
int number=a;
int reverse=0;
while(a>0){
  int digit=a%10;
  reverse=reverse*10+digit;
  a=a/10;
}
return number==reverse;
}
int isArmstrong(int a){
  int digits=countdigits(a);
    int compare=a;
      int sum=0;
      while(a>0){
        int d=a%10; int temp=1;
      for(int i=0; i<digits; i++){
        temp*=d;
      }sum+=temp;
      a/=10;
      }
     return compare=sum;
}