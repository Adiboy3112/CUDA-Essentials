#include <stdio.h>
#include <time.h>
#define MAX_ROTATIONS  1000
#define GENERAL_MEMORY_PROBLEM printf( "You do not have enough memory ([m|re]alloc failure)\nDying\n\n" ) ; exit( EXIT_FAILURE ) ;
typedef struct __align__{
	int	n ;
	int	*z_twist ;
	int	*theta ;
	int	*phi ;
} Angle;
// __global__ void testfunc()
// {

// }
int main()
{
    Angle Angles,AnglesonGPU;
    if( (Angles.z_twist = ( int * ) malloc ( MAX_ROTATIONS * sizeof( int ) ) ) &&
      ( Angles.theta   = ( int * ) malloc ( MAX_ROTATIONS * sizeof( int ) ) ) &&
      ( Angles.phi     = ( int * ) malloc ( MAX_ROTATIONS * sizeof( int ) ) ) ) {
  } else {
    GENERAL_MEMORY_PROBLEM
  }
  cudaMalloc((void**)&AnglesonGPU,sizeof(Angle));
  cudaMalloc((void**)&AnglesonGPU.z_twist,MAX_ROTATIONS * sizeof( int ));
  cudaMalloc((void**)&AnglesonGPU.theta,MAX_ROTATIONS * sizeof( int ));
  cudaMalloc((void**)&AnglesonGPU.phi,MAX_ROTATIONS * sizeof( int ));
  printf("%zu",sizeof(Angles.z_twist));


}
