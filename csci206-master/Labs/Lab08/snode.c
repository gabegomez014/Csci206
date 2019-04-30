/* Gabe Gomez
 * March 7th, 2017/ 10 AM lab
 * lab 08 - snode.c
 */

#include <stdlib.h>
#include <string.h>
#include "snode.h"


struct snode *snode_create(char *s, int length) {	
	struct snode *new;
	
	new = malloc(sizeof(struct snode));
	
	strcpy((*new).str, s);
	(*new).length = length;
	(*new).next = NULL;
	
	return (new);
}
