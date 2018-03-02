#!/bin/bash
cd /sWebView/src
cmake .
make -j16
./run.sh
