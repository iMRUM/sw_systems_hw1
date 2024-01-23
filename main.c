#include "NumClass.h"
#include <stdio.h>

int main() {
    int number1;
    int number2;
    int max;
    int min;
    scanf("%d %d", &number1, &number2);
    if (number1 >= number2) {
        max = number1;
        min = number2;
    } else {
        max = number2;
        min = number1;
    }
    printf("The Armstrong numbers are:");
    for (int i = min; i <= max; i++) {
        if (isArmstrong(i)) {
            printf(" %d", i);
        }
    }
    printf("\nThe Palindromes are:");
    for (int i = min; i <= max; i++) {
        if (isPalindrome(i)) {
            printf(" %d", i);
        }
    }
    printf("\nThe Prime numbers are:");
    for (int i = min; i <= max; i++) {
        if (isPrime(i)) {
            printf(" %d", i);
        }
    }
    printf("\nThe Strong numbers are:");
    for (int i = min; i <= max; i++) {
        if (isStrong(i)) {
            printf(" %d", i);
        }
    }
    printf("\n");
}
