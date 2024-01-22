 #include "NumClass.h"
#include <stdio.h>
int main(){
    double sq=9;
    int a=37;
    int p=1234321;
    int k=407;
    double t=sqrt(sq);
    printf("%f\n",t);
    if(isStrong(a)){
        printf("%d is a strong number.\n",a);
    }else{
        printf("%d is not a strong number.\n",a);
    }

     if(isPrime(a)){
        printf("%d is a prime number.\n",a);
    }else{
        printf("%d is not a prime number.\n",a);
    }

     if(isPalindrome(p)){
        printf("%d is a Palindrome number.\n",p);
    }else{
        printf("%d is not a Palindrome number.\n",p);
    }
    if(isArmstrong(k)){
        printf("%d is a Armstrong number.\n",k);
    }else{
        printf("%d is not a Armstrong number.\n",k);
    }
return 0;
} 
 