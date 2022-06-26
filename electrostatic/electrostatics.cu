#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define MAX_ROTATIONS  80
#define GENERAL_MEMORY_PROBLEM printf( "You do not have enough memory ([m|re]alloc failure)\nDying\n\n" ) ; exit( EXIT_FAILURE ) ;

struct electrostatics
{
    int charge;

};
__global__ void testfunc(struct electrostatics *a)
{
    int i = threadIdx.x;
    a[i].charge=2+i;
}

int main()
{
    struct electrostatics *a,b[2];
    cudaMalloc(&a,2*sizeof(electrostatics));
    testfunc<<<1,2>>>(a);
    cudaDeviceSynchronize();
    cudaMemcpy(b,a,2*sizeof(electrostatics),cudaMemcpyDeviceToHost);
    cudaDeviceSynchronize();
    printf("%d %d",b[0].charge,b[1].charge);

}

