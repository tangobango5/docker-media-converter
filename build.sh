#! /bin/bash
source constants.sh
docker build -f Dockerfile -t $image:$tag .
