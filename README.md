# KALDodocker
A CPU docker file with lammps and kaldo


This will be a docker container that will install lammps with python support then install KALDo.
for CPU build do below.

mv Dockerfile-cpu Dockerfile

BUILD
docker build -t kaldo .

RUN
docker run -it --rm  -u $(id -u):$(id -g) kaldo /bin/bash


The above command will run KALDo in an interactive shell. You will have a full Ubuntu env to work with.

The devel will also install all of kaldo and keep it. This is mostly for debugging or if you need the whole package.



Dockerfile-GPU
This will allow for GPU support. It is up to you to install and get nvidia-cuda-tookit working.


mv DOckerfile-gpu Dockerfile

BUILD

docker build -t kaldo-gpu .

RUN

docker run -it --rm  -u $(id -u):$(id -g)  --gpus all kaldo /bin/bash

