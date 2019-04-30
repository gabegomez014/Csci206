/* Gabe Gomez
 * February 27th, 2017/ 10 AM lab
 * lab 07 - primes.c
 *
 * The times that were asked for at in the pre-lab
 * real: 0m22.931 s
 * user: 0m18.433 s
 * sys: 0m0.216 s
 */

#include <stdio.h>

#define MAX 10020

int is_prime(int n)
{
   // return 1 if n is prime, 0 otherwise

	int divisible = 2;
	
	for (divisible; divisible < n; divisible++) {
		if (n % divisible == 0) {
			return 0;
		}
	}
	
	return 1;
}

int main (void)
{
    int i, n = 0;

    for (i = 2; n < MAX; i++){
        if (is_prime(i)){
            if ((n % 10) == 0){
                printf("\n");
            }
            printf("%7d", i);
            n++;
        }
    }
    printf("\n");
}
