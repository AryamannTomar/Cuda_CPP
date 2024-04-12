import os

l=[ '1_Intro_to_CUDA_Prog_CUDA_progModel', 
    '2_CUDA_Exec_Model', 
    '3_CUDA_memModel', 
    '4_CUDA_SharedMem_ConstMem', 
    '5_CUDA_Streams', 
    '6_PerfTuning_w_CUDA_instrLevPrim', 
    '7_ParallelPatt_App', 
    '8_Bonus_Intro_to_Image_Proc_w_CUDA'
]

for i in l:
    if os.path.isdir(i):
        pass
    else:
        os.mkdir(i)