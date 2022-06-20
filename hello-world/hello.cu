#include <stdio.h>
#include <time.h>
__global__ void cuda_hello(){
    int x=threadIdx.x;
    int y=blockIdx.x;
    printf("Hello World from GPU! %d %d \n",x,y);
 
}

int main() {
    clock_t s,e;
    double time;
    s=clock();


    for (int i = 0; i < 9600; i++)
    {
        printf("Hello World from CPU!\n");

    }
    e=clock();
    time=e-s;
    double ti=time;
    printf("\n%f\n\n",time);
    s=clock();
    cuda_hello<<<100,96>>>();
    cudaDeviceSynchronize();
    e=clock();
    time=e-s;
    printf("\n%f  %f\n",time,ti);
    return 0;
}