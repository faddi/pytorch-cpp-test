#!/bin/bash

set -i

mkdir lib
cd lib

wget -c https://download.pytorch.org/libtorch/nightly/cpu/libtorch-macos-latest.zip
wget -c https://github.com/intel/mkl-dnn/releases/download/v0.17.3/mklml_mac_2019.0.1.20180928.tgz

unzip libtorch-macos-latest.zip
tar xzvf mklml_mac_2019.0.1.20180928.tgz

cp mklml_mac_2019.0.1.20180928/lib/* libtorch/lib/

cd ..

mkdir data

cd data
wget -c http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz
wget -c http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz
wget -c http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz
wget -c http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz

gunzip train-images-idx3-ubyte.gz
gunzip train-labels-idx1-ubyte.gz
gunzip t10k-images-idx3-ubyte.gz
gunzip t10k-labels-idx1-ubyte.gz

cd ..

mkdir build

cd build && cmake .. && make && ./example-app
