#!/bin/bash
SLURMCONFIG="/etc/slurm-llnl/slurm.conf"
MUNGEKEY="/etc/munge/munge.key"
sWebView="./sWebView"
docker run \
	--rm \
	-v $SLURMCONFIG:/etc/slurm-llnl/slurm.conf \
	-v $MUNGEKEY:/etc/munge/munge.key \
	-v $sWebView:/swebView \
	-p 8080:8080 \
	local/swebview
