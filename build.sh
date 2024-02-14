#!/bin/bash
tar -xvf windranger.tar.gz
## install required llvm
sudo apt-get update && sudo apt-get install -yy clang-10 llvm-10-dev

## install wclang and gclang
if ! [ -x "$(command -v wllvm)"  ]; then
    pip3 install --upgrade pip==9.0.3
    pip3 install wllvm
    export LLVM_COMPILER=clang
fi
if ! [ -x "$(command -v gclang)"  ]; then
    rm -rf /usr/bin/go
    wget https://dl.google.com/go/go1.17.1.linux-amd64.tar.gz
    tar -xvf go1.17.1.linux-amd64.tar.gz
    mv go go_install
    export GOROOT=/home/yuntong/vulnfix/thirdparty/WindRanger/go_install
    mv go_install/bin/go /usr/bin
    
    mkdir /root/go
    go get github.com/SRI-CSL/gllvm/cmd/...
    export PATH=/root/go/bin:$PATH
fi
