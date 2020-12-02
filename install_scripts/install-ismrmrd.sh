#!/bin/bash

current_dir=$PWD
mkdir -p ~/source
cd ~/source
git clone https://github.com/ismrmrd/ismrmrd
cd ismrmrd
mkdir build
cd build
cmake -DHDF5_ROOT=/usr ../
make -j 8
sudo make install
cd $current_dir