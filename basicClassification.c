#include <stdio.h>
#include <string.h>
#include "NumClass.h"

int isPrime(int a) {
    for (int i = 2; i * i <= a; i++) {
        if (a % i == 0) {
            return 0;
        }
    }
    return 1;
}

int isStrong(int a) {
    int digits = countdigits(a);
    int sum = 0;
    char str[digits];
    sprintf(str, "%d", a);
    for (int i = 0; i < digits; i++) {
        int temp = str[i] - '0';
        int b = factorial(temp);
        sum += b;
    }
    if (sum == a)return 1;
    else
        return 0;
}

int countdigits(int a) {
    int digits = 0;
    if (a == 0) { return 0; }
    while (a > 0) {
        digits++;
        a = a / 10;
    }
    return digits;
}

int factorial(int a) {
    int ans = 1;
    for (int i = 1; i <= a; i++) {
        ans *= i;
    }
    return ans;
}

int Flip(int a) {
    if (a == 0)return 0;
    int c = countdigits(a);
    int sum = 1;
    for (int i = 1; i < c; i++) {
        sum *= 10;
    }
    return ((a % 10) * sum) + Flip(a / 10);
}


