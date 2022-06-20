#include <stdio.h>
#include <cuda.h>
#include <time.h>
#define N 256
__global__ void add(int *a, int *b, int *c)
{
 int tID = threadIdx.x;
 if (tID < N)
 {
 c[tID] = a[tID] + b[tID];
 }
}
int main()
{
 int a[N], b[N], c[N];
 int *dev_a, *dev_b, *dev_c;
 cudaMalloc((void **) &dev_a, N*sizeof(int));
 cudaMalloc((void **) &dev_b, N*sizeof(int));
 cudaMalloc((void **) &dev_c, N*sizeof(int));
 // Fill Arrays
 for (int i = 0; i < N; i++)
 {
 a[i] = i,
 b[i] = 1;
 }
 clock_t s,e;
 s=clock();
 double time;

 cudaMemcpy(dev_a, a, N*sizeof(int), cudaMemcpyHostToDevice);
 cudaMemcpy(dev_b, b, N*sizeof(int), cudaMemcpyHostToDevice);
 add<<<1,N>>>(dev_a, dev_b, dev_c);
 cudaMemcpy(c, dev_c, N*sizeof(int), cudaMemcpyDeviceToHost);
 for (int i = 0; i < N; i++)
 {
 printf("%d + %d = %d\n", a[i], b[i], c[i]);
 }
 e=clock();
 time=e-s;
 printf("%f is the time taken",time);

 return 0;
}
