#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include "stdio.h"

__global__ void hello_cuda(){
    printf("Hello CUDA World! \n");
}

int main(){
    /*
        Grid: Collection of All threads launch for a kernel
        Block: Threads in a grid is organized into groups called thread blocks
        
        Kernel Launch Parameters (Total: 4)
        Kernel_Name <<< grid, block >>>();
        Kernel_Name <<< number_of_blocks, thread_per_block >>>(arguments);
    */
    
    /*
        hello_cuda<< <1,1> >> (); 

        Now 20 Threads are going to execute print function
        hello_cuda<< <1,20> >> (); 
    */

    /*
        Implicitly Intialized Variables 
            - threadIdx
            - blockIdx
            - blockDim
            - gridDim

        int nx, ny;
        nx=16;
        ny=4;
        dim3 block(8,2);
        dim3 grid(nx/block.x,ny/block.y);
        hello_cuda<< <grid, block> >>();
    */
    // 32 Thread Blocks arranged into 8 thread blocks ion X dimension each having 4 threads
    dim3 block(4);
    dim3 grid(8);
    hello_cuda<<<grid,block>>>();

    // Gurantees Host Code to wait untill all previous launch kernels finish their execution
    cudaDeviceSynchronize(); // As kernel Launch is an asynchronous fn call, Host does not have to wait untill the Kernel Execution Finish
    cudaDeviceReset();
    return 0;
}