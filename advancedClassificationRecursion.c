#include <stdio.h>
#include "NumClass.h"


int isArmstrong(int a){
    int digit=countdigits(a);
if(isArmstrongHelp(a,digit,0)==a)return 1; else return 0;
}
int isArmstrongHelp(int a,int digit,int compare){
        if (a==0){
        return compare;
        }
int leftovers=a%10;
int sub=1;
    for(int i=0; i<digit; i++){
     sub*=leftovers;
    }
    return isArmstrongHelp(a/10,digit,compare+sub);
}
int isPalindrome(int a){
   return a==Flip(a);
}