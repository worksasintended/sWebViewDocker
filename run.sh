#!/bin/bash
SLURMCONFIG="/etc/slurm-llnl/slurm.conf"
MUNGEKEY="/etc/munge/munge.key"
sWebView="`pwd`/sWebView"
docker run \
	-it \
	-v $SLURMCONFIG:/etc/slurm-llnl/slurm.conf \
	-v $MUNGEKEY:/etc/munge/munge.key \
	-v $sWebView:/sWebView \
	-p 8080:8080 \
	local/swebview bash 
