#include <stdio.h>
#define MAX_ITEMS 100

int count = 0;

int collatz(int n)
{
    // TODO implement this function to return
    // if n is 1: 1
    // if n is even: n / 2 
    // if n is odd: 3 * n + 1
    // checking for even/oddness in C is a debatable topic:
    // http://stackoverflow.com/questions/160930/how-do-i-check-if-an-integer-is-even-or-odd

	int mod = n % 2;
	
	if (n == 1) {
		return 1;
	}
	
	else if (mod == 0) {
		return n / 2;
	}
	
	else {
		return 3 * n + 1;
	}
}

int find_length(int n)
{
    // TODO: implement a recursive function to count the number of
    // calls to collatz needed to reach 1 starting with n.
    // We suggest you follow the same structure as the following
    // factorial function:
    // int factorial (int i)
    // {
    //   if (i <= 1)
    //     return 1;
    //   else
    //     return i * factorial (i-1);
    // }
	
	if (n == 1) {
		return 1;
	}
	
	else {
		n = collatz(n);
		return 1 + find_length(n);
	}    
    
}


int main(void)
{
    int i;

    for (i=1; i<MAX_ITEMS; i++){
        printf ("%d ==> %d\n", i, find_length(i));
    }

    return 0;
}
