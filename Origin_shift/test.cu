#include <cufft.h>
#include <stdio.h>

    cufftReal *a,*b;
    cufftComplex *c;


__global__ void Adderf(cufftReal *a,float b,float c)
{
    *a=b+c;
    
}
void foo(cufftReal *a)
{
    float a1=2.0,b1=3.5;
    Adderf<<<1,1>>>(a,a1,b1);
}
int main()
{
    if(cudaMalloc((void**)&a,sizeof(cufftReal))==cudaErrorMemoryAllocation)printf("wgharts");
    b=(cufftReal *)malloc(sizeof(cufftReal));
  
    foo(a);
    cudaDeviceSynchronize();
    cudaMemcpy(b,a,sizeof(cufftReal),cudaMemcpyDeviceToHost);
    c = (cufftComplex *)b;
    c->y=1.5;

    printf("%f",(c->x+c->y));

}