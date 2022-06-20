#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define N 256


int main()
{
 int *a;
 a=(int *)malloc(N*sizeof(int));
 printf("%zu",sizeof(&a));

}
