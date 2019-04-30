/* Gabe Gomez
 * February 27th, 2017/ 10 AM lab
 * lab 07 - counte.c
 */
 
#include <stdio.h>
#define MAX_LENGTH 100
 
extern void counte(char*);

int main (void) {
	char str[MAX_LENGTH];
	
	printf("Please enter a string of anything you please: ");
	scanf("%s", str);
	counte(str);
	return 0;
}
