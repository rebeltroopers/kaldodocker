# kaldodocker
A CPU docker file with lammps and kaldo


This will be a docker container that will install lammps with python support then install kaldo.


BUILD
docker build -t kaldo .

RUN
docker run -it --rm  kaldo /bin/bash

