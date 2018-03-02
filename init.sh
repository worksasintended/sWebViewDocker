#!/bin/bash
cd /swebView
cmake .
make -j 16
./run.sh
