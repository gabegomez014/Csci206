/* Gabe Gomez
 * 02/12/2017 / 10 AM lab
 * lab 04 - head.c
 * compile with: gcc
 * notes: none
 */
 
 
// for O_RDONLY, etc.
#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "fileio.h"

#define LINES 10 
#define MAXBYTES 1024
 
int main(int argc, char* argv[])
{
    int readbytes = 10;         // default to 10 bytes
    char buffer[MAXBYTES+1];    // buffer to hold file data
    char buff[LINES+1];
 
    if (argc < 2){
        // missing required argument
        printf("Usage %s <filename> [<bytes>]\n", 
                argv[0]);
        exit(-1);
    }
    if (argc > 2){
        // process optional bytes argument
        readbytes = atoi(argv[2]);
        if (readbytes > MAXBYTES){            
            printf("bytes is too large, max supported value is %d!\n",
                    MAXBYTES);
            exit(-2);
        }
    }
    if (read_file_bytes(argv[1], readbytes, buffer) >= 0){
        printf("%s\n", buffer);
    }
    
    if (read_file_lines(argv[1], buff)) {
    	printf("%s\n", buff);
    } 
    else {
        printf("Error: could not read file!\n");
        exit(-3);
    }
    return 0;
}
