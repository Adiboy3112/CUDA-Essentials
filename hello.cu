#include <stdio.h>
#include <cufft.h>
__global__ void cuda_hello(){
    printf("Hello World from GPU!\n");
}

int main() {
    cufftPlan3d()
    cuda_hello<<<1,1>>>(); 
    return 0;
}