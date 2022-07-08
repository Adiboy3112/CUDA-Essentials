#include <cufft.h>
#include <stdio.h>

__global__ void Adderf(cufftReal *a,float b,float c)
{
    *a=b+c;
    
}
int main()
{
    cufftReal *a,b;
    float a1=2.0,b1=3.5;
    if(cudaMalloc((void**)&a,sizeof(cufftReal))==cudaErrorMemoryAllocation)printf("wgharts");
  
    Adderf<<<1,1>>>(a,a1,b1);
    cudaDeviceSynchronize();
    cudaMemcpy(&b,a,sizeof(cufftReal),cudaMemcpyDeviceToHost);

    printf("%f",b);

}