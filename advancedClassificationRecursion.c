#include <stdio.h>
#include "NumClass.h"

// function to find if a number is a armstrong number.
int isArmstrong(int a){
    int digit=countdigits(a);
if(isArmstrongHelp(a,digit,0)==a)return 1; else return 0;
}
// a recurisve function that return that sum each digit of the required number
// power the number digits.
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
// a function that return if a number is palindrome use Flip function.
int isPalindrome(int a){
   return(a==Flip(a));
}
// a recursive function that "flip" the number digits
// example 123 -- 321
int Flip(int a){
if (a==0)return 0;
 int c=countdigits(a);
 int sum=1;
 for (int i = 1; i < c; i++)
 {
    sum*=10;
 }
 return((a%10)*sum)+Flip(a/10);
}