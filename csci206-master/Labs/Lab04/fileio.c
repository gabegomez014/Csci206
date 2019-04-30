/* Gabe Gomez
 * 02/12/2017 / 10 AM lab
 * lab 04 - fileio.c
 * compile with: gcc
 * notes: none
 */

#include <fcntl.h>
#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
 
int read_file_bytes (char* filename, int bytes, char* buffer)
/*
 * Reads data from a file and append a null terminator.
 * 
 *  filename: full path and filename to read from.
 *  bytes: maximum number of bytes to read.
 *  buffer: where to put the read data (note need bytes+1!).
 *  Return value: number of bytes read or -1 on error.
 */
{
    FILE *fileOpen = fopen(filename, "r");

	if (fileOpen == NULL) {
		printf("ERROR: File could not be opened");
		return -1;
	}
	
	return fread(buffer, bytes, 1, fileOpen);;
}
