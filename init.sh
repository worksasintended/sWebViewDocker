#!/bin/bash
cd /sWebView/src
cmake .
make -j16
sudo -u munge munged  --num-threads=10 &
./run.sh
