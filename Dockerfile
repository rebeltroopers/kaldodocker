FROM ubuntu:latest
# This hack is widely applied to avoid python printing issues in docker containers.
# See: https://github.com/Docker-Hub-frolvlad/docker-alpine-python3/pull/13
ENV PYTHONUNBUFFERED=1
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
    ENV LANG en_US.utf8
    RUN apt update && apt upgrade -y && apt install -y vim curl python3  pip libglib2.0-0 libgl1 libegl1 libxkbcommon0 dbus libopengl0 build-essential git ccache openmpi-bin libopenmpi-dev python3.10-venv cmake build-essential libblas-dev liblapack-dev

    WORKDIR /mnt/work
    COPY    requirements.txt /mnt/work/.
    RUN pip3 install git+https://github.com/nanotheorygroup/kaldo
    RUN pip3 install -r requirements.txt
    RUN git clone https://github.com/lammps/lammps.git lammps
    RUN cd lammps \
        && mkdir build \
        && cd build/ \
        && cmake ../cmake\
        -DBUILD_SHARED_LIBS=yes \
	-DMLIAP_ENABLE_PYTHON=yes \
	-DPKG_PYTHON=yes \
        -DPKG_MANYBODY=yes \
	-DPKG_KSPACE=yes \
	-DPKG_PHONON=yes \
	-DPYTHON_EXECUTABLE:FILEPATH=`which python`\
	&& make -j 8 \
	&& make install-python 
    WORKDIR /root/

