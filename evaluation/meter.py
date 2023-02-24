import psutil
import time
import numpy as np

cpu_use = []
mem_use = []

#Measuring the cpu and memory-utilization every millisecond for 90 seconds
for i in range(120000):
   cpu_use.append(psutil.cpu_percent())
   mem_use.append(psutil.virtual_memory().percent)
   time.sleep(0.001)

#Converting into numpy-arrays and using numpy-saving function to create plot in different file (see plot.ipynb)
cpu = np.asarray(cpu_use)
mem = np.asarray(mem_use)
with open('result_with_kube2.npy', 'wb') as f:
   np.save(f, cpu)
   np.save(f, mem)
print(cpu_use)
