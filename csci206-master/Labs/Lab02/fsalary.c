/* Gabe Gomez
 * January 24th, 2017/ 10 AM lab
 * lab 02 - salary.c
 * compile with: make salary
 * notes: none
 */
#include <stdio.h>
 
int main(void) {
   float hourlyWage;
   int weeksWorked = 40;
 
   printf("Enter an hourly wage (float): ");
   scanf("%f",&hourlyWage);
   printf("Enter weeks worked (integer): ");
   scanf("%d",&weeksWorked);
   printf("Annual salary is: ");
   printf("$%.2f", hourlyWage * weeksWorked * 50);
   printf("\n");
 
   return 0;
}
