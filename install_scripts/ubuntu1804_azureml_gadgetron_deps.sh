#!/bin/bash

if [ -z "$(which conda)" ]; then
    echo "Conda is missing. You may need to run '/anaconda/bin/conda init bash'"
    exit 1
fi


if [ -z "$(conda env list | grep gadgetron)" ]; then
    condaenv=$(dirname $0)/../conda/gadgetron-environment.yml
    conda env create -f=$condaenv
fi

# Make sure we are in the right conda environment
eval "$(command conda 'shell.bash' 'hook' 2> /dev/null)"
conda activate gadgetron

sudo apt update
sudo apt install --no-install-recommends --no-install-suggests --yes  \
    apt-utils \
    build-essential \
    cmake \
    cpio \
    cuda-toolkit-11-1 \
    gcc-multilib \
    h5utils \
    hdf5-tools \
    jove \
    jq \
    libace-dev \
    libarmadillo-dev \
    libatlas-base-dev \
    libboost-all-dev \
    libcrypto++-dev \
    libdcmtk-dev \
    libfftw3-dev \
    libfreetype6-dev \
    libgtest-dev \
    libhdf5-serial-dev \
    liblapack-dev \
    liblapacke-dev \
    libopenblas-base \
    libopenblas-dev \
    libplplot-dev \
    libpugixml-dev \
    librange-v3-dev \
    libxml2-dev \
    libxslt-dev \
    net-tools \
    pkg-config \
    python3-dev \
    python3-pip \
    software-properties-common \
    wget

# for embedded python plot, we need agg backend
# RUN mkdir -p /root/.config/matplotlib && touch /root/.config/matplotlib/matplotlibrc && echo "backend : agg" >> /root/.config/matplotlib/matplotlibrc

# compile dcmtk
#RUN mkdir /opt/code && \
#    cd /opt/code && \
#    wget https://dicom.offis.de/download/dcmtk/dcmtk365/dcmtk-3.6.5.tar.gz && \
#    tar xvf /opt/code/dcmtk-3.6.5.tar.gz && \
#    mkdir /opt/code/dcmtk-3.6.5/build && \
#    cd /opt/code/dcmtk-3.6.5/build && \
#    cmake -DBUILD_SHARED_LIBS=ON ../ && make -j16 && make install && cd /opt/code && \
#    rm -rf /opt/code/dcmtk-3.6.5 && rm -rf /opt/code/dcmtk-3.6.5.tar.gz

#RUN cd /opt/code && \
#    git clone https://github.com/google/googletest.git && \
#    cd googletest && \
#    mkdir build && \
#    cd build && \
#    cmake -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release ../ && \
#    make -j $(nproc) && make install && cd /opt/code && rm -rf /opt/code/googletest

#Set more environment variables in preparation for Gadgetron installation
# ENV GADGETRON_HOME=/usr/local \
#    ISMRMRD_HOME=/usr/local

#ENV PATH=$PATH:/usr/local/cuda/bin;$GADGETRON_HOME/bin:$ISMRMRD_HOME/bin \
#    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:$ISMRMRD_HOME/lib:$GADGETRON_HOME/lib

# ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs:${LIBRARY_PATH}