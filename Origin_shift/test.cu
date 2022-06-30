#include <stdio.h>
#include <time.h>
#include <stdlib.h>
__global__ void foo(int *s)
{
    int idx = threadIdx.x;
    int sum = 0;
    for (int i = idx; i < ; i += blockSize)
        sum += a[i];
    __shared__ int r[blockSize];
    r[idx] = sum;
    __syncthreads();
    for (int size = blockSize/2; size>0; size/=2) { //uniform
        if (idx<size)
            r[idx] += r[idx+size];
        __syncthreads();
    }
    if (idx == 0)
        *out = r[0];
}

int main()
{
    int *sum,a=0;
    cudaMalloc((void**)&sum,sizeof(int));
    cudaMemcpy(sum,&a,sizeof(int),cudaMemcpyHostToDevice);
    foo<<<1,10>>>(sum);
    cudaDeviceSynchronize();
    cudaMemcpy(&a,sum,sizeof(int),cudaMemcpyDeviceToHost);
    printf("%d",a);


}