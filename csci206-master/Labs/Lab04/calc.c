/* Gabe Gomez
 * February 8th, 2017/ 10 AM lab
 * lab 04 - calc.c
 * notes: none
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char* argv[]) {
	float result = 0;
	int i;
	if(argc < 3) {
		printf("Usage: ./calc <operation> <arguments>\n");
	}
	
	else if (strcmp(argv[1], "add") == 0) {
		for (i = 2; i < argc; i++) {
			float value = atof(argv[i]);
			result += value;
		}
		printf("%.6f\n",result);
	}
	
	else if (strcmp(argv[1], "mult") == 0) {
		float value = atof(argv[2]);
		result += value;
		
		for (i = 3; i < argc; i++) {
			float value = atof(argv[i]);
			result *= value;
		}
		printf("%.6f\n",result);
	} 
	
	else if (strcmp(argv[1], "div") == 0) {
		float value = atof(argv[2]);
		result += value;
		
		for (i = 3; i < argc; i++) {
			float value = atof(argv[i]);
			result /= value;
		}
		printf("%.6f\n",result);
	} 
	
	else if (strcmp(argv[1], "len") == 0) {
		int length = 0;
		for (i = 2; i < argc; i++) {
			length += strlen(argv[i]);
		}
		printf("%d\n", length);
	}
	
	else {
		printf("Unsupported function, try: add, mult, div or len\n");
	} 
return 0;
}
