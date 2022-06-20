#include <stdio.h>
#include <time.h>
#define N 256
void add(int *a, int *b, int *c)
{
for (int i = 0; i < N; i++)
{
    c[i]=a[i]+b[i];
}

}
int main()
{
 int a[N], b[N], c[N];
 // Fill Arrays
 for (int i = 0; i < N; i++)
 {
 a[i] = i,
 b[i] = 1;
 }
 clock_t s,e;
 s=clock();
 double time;
 add(a,b,c);
 for (int i = 0; i < N; i++)
 {
 printf("%d + %d = %d\n", a[i], b[i], c[i]);
 }
 e=clock();
 time=e-s;
 printf("%f is the time taken",time);

 return 0;
}
