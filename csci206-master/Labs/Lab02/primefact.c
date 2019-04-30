/* Gabe Gomez
 * January 24th, 2017/ 10 AM lab
 * lab 02 - primefact.c
 * notes: In my experiment I had noticed that the program created with C was much faster than the python program that was given. If I am reading it correctly, it seems that the program did not even take one second to run and provide an output, while the python program took about 4 seconds to fully run.
 */
#include <stdio.h>

int main(void) {
   int n = 2147483645;
   int i = 2;

   while (i <= n) {
	if (n % i == 0) {
	   printf("%d\n", i);
	   n = n / i;
	   i -= 1;
	}
	i += 1;
   }
}
