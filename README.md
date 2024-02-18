# KALDodocker
A CPU docker file with lammps and kaldo


This will be a docker container that will install lammps with python support then install KALDo.
for CPU build do below.

mv Dockerfile-cpu Dockerfile

BUILD
docker build -t kaldo .

RUN
docker run -it --rm  kaldo /bin/bash


The above command will run KALDo in an interactive shell. You will have a full Ubuntu env to work with.
