#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#define MAX_ROTATIONS  80
#define GENERAL_MEMORY_PROBLEM printf( "You do not have enough memory ([m|re]alloc failure)\nDying\n\n" ) ; exit( EXIT_FAILURE ) ;
typedef struct __align__{
	int	*z_twist ;
	int	*theta ;
	int	*phi ;
} Angle;
__global__ void testfunc(Angle Angles)
{
    int i=threadIdx.x;
    Angles.z_twist[i] = i ;
    Angles.theta[i]   = 0 ;
    Angles.phi[i]     = 1 ;
    printf("%d\n",Angles.z_twist[i]);



}
int main()
{
    Angle Angles,AnglesonGPU;
  Angles.z_twist = ( int * ) malloc ( MAX_ROTATIONS * sizeof( int ));
  Angles.theta   = ( int * ) malloc ( MAX_ROTATIONS * sizeof( int ));
  Angles.phi     = ( int * ) malloc ( MAX_ROTATIONS * sizeof( int )); 
  printf("%zu\n\n",sizeof(Angles));

  cudaMalloc((void**)&AnglesonGPU.z_twist,MAX_ROTATIONS * sizeof( int ));
  cudaMalloc((void**)&AnglesonGPU.theta,MAX_ROTATIONS * sizeof( int ));
  cudaMalloc((void**)&AnglesonGPU.phi,MAX_ROTATIONS * sizeof( int ));
  testfunc<<<1,MAX_ROTATIONS>>>(AnglesonGPU);
  cudaDeviceSynchronize();
  int x=MAX_ROTATIONS*sizeof(int);
  cudaMemcpy(Angles.z_twist, AnglesonGPU.z_twist,x,cudaMemcpyDeviceToHost);
  cudaDeviceSynchronize();
  for (int i = 0; i < MAX_ROTATIONS; i++)
  {
    printf("%d\n",Angles.z_twist[i]);
  }
  





}
