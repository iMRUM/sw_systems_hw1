#include <stdio.h>
#include <string.h>
#include "NumClass.h"
// basic function to find if number is a prime a number
int isPrime(int a) {
    if(a==1){
        return 1;
    }
    for (int i = 2; i * i <= a; i++) {
        if (a % i == 0) {
            return 0;
        }
    }
    return 1;
}

// function to find if a number is strong number.
int isStrong(int a){
    int digits=countdigits(a);
    int sum=0;
   char str [digits]; 
    sprintf(str,"%d",a);
     for (int i = 0; i < digits; i++)
     {
        int temp=str[i]-'0';
        int b=factorial(temp);
         sum+=b;
     }
     if(sum==a)return 1;else
    return 0;
}
// a function the return the number of digits of the number.
int countdigits(int a){
    int digits=0;
    if(a==0){ return 0;}
 while(a>0){
digits++;
a=a/10;
 }
    return digits;
}
//function to find for every positive x: x!
int factorial(int a){
    int ans=1;
    for(int i=1; i<=a; i++){
        ans*=i;
    }
    return ans;
}

