#include "NumClass.h"
#include <math.h>

int sqrt_number;
int temp_factorial;
int i;
int isPrime(int n){
    sqrt_number=(int) floor(sqrt(n));
    for (i = TWO; i < sqrt_number; i++) {
        if(n % i == ZERO){
            return FALSE;
        }
    }
    return TRUE;
}
//will use shift left operator for dividing, <<5 is n/10 (5 shifts left)
int isStrong(int n){
    return FALSE;
}