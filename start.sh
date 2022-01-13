#!/bin/bash

#module load python/last
#conda create -n acemd_env -c conda-forge -c acellera acemd3

source /share/apps/acemd3.sh
conda activate acemd_env

for dev in 0 1 2 3; do
  mkdir -p GPU_${dev}
  cp template/* ./GPU_${dev}/
  cd GPU_${dev}
  echo "Device $dev" > GPU_${dev}.log

  echo "acemd3 --device ${dev} input_acemd.inp" >> GPU_${dev}.log
  screen -A -m -d -S GPU_${dev} sh -c "acemd3 --device ${dev} input_acemd.inp >> GPU_${dev}.log"
  cd ../
    sleep 1
done
