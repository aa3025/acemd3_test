#!/bin/bash

module load python/last
#conda create -n acemd_env -c conda-forge -c acellera acemd3
conda activate acemd_env

for dev in $(0 3); do
  mkdir -p GPU_${dev}
  cp template/* ./GPU_${dev}/
  cd GPU_${dev}
  screen -A -m -d -S GPU_${dev} sh -c "acemd3 --device ${dev} input_acemd.inp | tee GPU_${dev}.log"
  cd ../
done