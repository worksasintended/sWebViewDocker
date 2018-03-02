#!/bin/bash
cd /swebView
cmake .
make -j16
./run.sh
