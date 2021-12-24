#! /bin/bash

source build.sh
docker push $image:$tag
