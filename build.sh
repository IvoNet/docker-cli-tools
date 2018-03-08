#!/usr/bin/env bash

docker build -t ivonet/nas-cli-tools .
#docker rmi $(docker images -q -f dangling=true)
