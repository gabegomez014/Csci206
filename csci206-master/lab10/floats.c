/*
 * CSCI 206 Computer Organization & Programming
 * Author: Alan Marchiori
 * Date: 2014-03-01
 * Copyright (c) 2014 Bucknell University
 *
 * Permission is hereby granted, free of charge, to any individual or
 * institution obtaining a copy of this software and associated
 * on files (the "Software"), to use, copy, modify, and
 * distribute without restriction, provided that this copyright and
 * permission notice is maintained, intact, in all copies and supporting
 * documentation.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL BUCKNELL UNIVERSITY BE LIABLE FOR ANY CLAIM, DAMAGES
 * OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
 * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
 * OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#include <stdio.h>
#include <string.h>
#include <math.h>
#include <stdbool.h>

//#define EPSILON 0.05

/* Forward declaration for our assembly functions
 * so gcc knows the return type (the return type defaults
 * to int so, it would look in the $v0 register w/o this).
 * Knowning the return type is a float/double gcc will
 * look in the $f0 (float) or $f0-$f1 (double) registers.
 */
float one_half_single(void);
double one_half_double(void);

int main()
{ 
    printf ("0.5 (single) = %f\n", one_half_single());
    printf ("0.5 (double) = %lf\n", one_half_double());

    return 0;
}

int inspect_float(float number) {
	int sign = NULL;
	int exponent = NULL;
	int fraction = NULL;
	char *str = NULL;
	
	if (number > 0) {
		sign = 0;
	}
	
	else {
		sign = 1;
	}
	
	
	getBin(number, str);
	//printf("%f", number);
	
	int i = 0;
	char mantissa[strlen(str)];
	int mantissaBit = 0;
	
	for (i; i < strlen(str); i++) {
		if (i == 0) {
			continue;
		}
		
		exponent++;
		mantissa[mantissaBit] = str[i];
		mantissaBit++;
		
	}
	
	char *exponentStr = NULL;
	getBin(exponent, exponentStr);
	
	printf("sign = %d\t", sign);
	printf("exponent = %s", exponentStr);
	printf("fraction = %s", mantissa);
	
	return 0;
}

int getBin(int num, char* str)
{
  *(str+5) = '\0';
  int number = 0x10 << 1;
  while(number >>= 1)
    *str++ = !!(number & num) + '0';
  return 0;
}

int precision() {
	// The next  single precision float after 1.0 is 1.125. 
	// With my knowledge on floating representation
	// I would say that the difference between all 
	// consectutive floating point numbers is the same. 
	
	// With a smaller number, the precision is more precise than
	// if a large number were to be passed. The reason being that the
	// larger number takes up more bytes for its integer value, thus 
	// not allowing more bytes for precision.
	float intial = 1.0;
	float test1 = 1.125;
	float test2 = 1.25;
	
	return 0;
}

bool is_near(float number1, float number2, float epsilon) {
	float difference = number1 - number2;
	difference = fabs(difference);
	
	if (difference <= epsilon) {
		return true;
	}
	
	return false;
}

void sum() {
	// The reason that this does not return 100 is because
	// since we are only adding 0.1, the count gets stuck between two
	// other numbers when considering precision 
	// (i.e. stuck somewhere between 99 and 100).
	// Since precision goes by increments of 0.125, it makes sense that
	// the precision is off because incrementing by 0.1
	// puts you between the precision of two different numbers.
	 
    float a = 0.1;
    float sum = 0;
    float compare = 100.0;
    const float EPSILON = 0.025;
    int i;
    for (i = 0; i < 1000; i++)
    {
        sum += a;
    }

    printf ("a = %1.28f, sum = %1.28f, sum == 100 ==> %s\n",
            a,
            sum,
            is_near(sum, compare, EPSILON) ? "TRUE":"FALSE");

    inspect_float(a);
    inspect_float(sum);
    inspect_float(100-sum);
}
