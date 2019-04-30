/* Gabe Gomez
 * April 11th, 2017/ 10 AM lab
 * lab 11 - over5.c
 */

#include <stdio.h>
#include <stdlib.h>

int main(int argc, char** argv) {
//In order to be clear, this will be a function that introduces
//trisk of buffer overflow on purpose

	char firstFruit[5];
	char secondFruit[10];
	
	printf("Enter a fruit whose name is no more than 4 letters long: ");
	scanf("%4s", firstFruit);
	
	printf("Enter a fruit whose name is nore more than 9 letters long: ");
	scanf("%s", secondFruit);
	
	printf("You now have a %s fruit", strcat(firstFruit, secondFruit));
	
}
