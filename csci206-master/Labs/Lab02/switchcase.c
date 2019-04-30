#include <stdio.h>
#include <string.h>
#include <ctype.h>
 
int main(){
 
    char string[256];   // store input string
    int i;              // loop index
    //int len;            // store input string length *Not sure if I needed to use len, but I found no nede for it. Since it came up as unused when I compiled with -Wall, I commented it out.
 
    // this loop will read one line of input at a time
    // if EOF is reached, fgets() will return false, thus the loop will exit.
    while ( fgets(string, 256,stdin)){
    	/* convert the string here */
        while(string[i]){
 	   string[i] = toupper(string[i]);
	   i++;
	}
    	// print the result
    	 printf("%s",string);
	i = 0; 
    }
                                            
    return 0;
}
