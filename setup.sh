#!/bin/bash

set -i

wget -c https://download.pytorch.org/libtorch/nightly/cpu/libtorch-macos-latest.zip
wget -c https://github.com/intel/mkl-dnn/releases/download/v0.17.3/mklml_mac_2019.0.1.20180928.tgz

unzip libtorch-macos-latest.zip
tar xzvf mklml_mac_2019.0.1.20180928.tgz

cp mklml_mac_2019.0.1.20180928/lib/* libtorch/lib/

mkdir build

cd build && cmake .. && make && ./example-app
