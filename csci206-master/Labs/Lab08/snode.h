/* Gabe Gomez
 * March 7th, 2017/ 10 AM lab
 * lab 08 - snode.h
 */
 
struct snode {
 	char str[101];
 	int length;
 	struct snode *next;
 };

struct snode *snode_create(char *s, int length);
