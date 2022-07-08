#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define MAX_ROTATIONS  80
#define GENERAL_MEMORY_PROBLEM printf( "You do not have enough memory ([m|re]alloc failure)\nDying\n\n" ) ; exit( EXIT_FAILURE ) ;

struct Atom{
    int charge;
    int name;
};
struct Residue
{
    int n;
    struct Atom *atoms;

};

__global__ void foo2(struct Residue *r)
{
    
    int i=threadIdx.y;
    int j= threadIdx.x;
    r[i].atoms[j].name=j;
    r[j].atoms[j].charge=j;
    printf("reached\n");
    printf("%d %d\n",r[i].atoms[j].name,r[j].atoms[j].charge);

}



int main()
{
    struct Residue r[2],*rc;

        cudaMalloc((void**)&(r[0].atoms),2*sizeof(struct Atom));
        cudaDeviceSynchronize();
        cudaMalloc((void**)&(r[1].atoms),2*sizeof(struct Atom));
        cudaDeviceSynchronize();
        cudaMalloc((void**)&rc,2*sizeof(struct Residue));
        cudaDeviceSynchronize();
        cudaMemcpy(rc,r,2*sizeof(struct Residue),cudaMemcpyHostToDevice);
        cudaDeviceSynchronize();

    
     printf("hello whatsup");

    
    

    dim3 threadsperblock(2,2);
    foo2<<<1,threadsperblock>>>(rc);
    cudaDeviceSynchronize();
  


    

}

