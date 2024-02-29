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
to mount your current directory so that you can transfer files from Docker container to your actual computer you may want to add the -v command
i.e.

docker run -it --rm  -u $(id -u):$(id -g) -v $(pwd):/root/ kaldo /bin/bash

This will mount your pwd to /root in the docker container and will be the default.



Dockerfile-GPU
This will allow for GPU support. It is up to you to install and get nvidia-cuda-tookit working.


mv DOckerfile-gpu Dockerfile

BUILD

docker build -t kaldo-gpu .

RUN

docker run -it --rm  -u $(id -u):$(id -g)  --gpus all kaldo /bin/bash

the --gpus will run all availiable gpus.
You can specifiy how many gpus with --gpus=0,1 to use gpu 0 and gpu 1.
These gpus with the docker container and may not be what you use.

Full understanding of how docker gpua nd installiation can be found at https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html
https://www.tensorflow.org/install/docker



The devel will also install all of kaldo and keep it. This is mostly for debugging or if you need the whole package.

