#! /bin/bash
source constants.sh

docker kill $container || true
docker rm $container || true
docker rmi $image || true

source build.sh

if [[ $stream ]];
then
  echo "Got base folder: $stream"
else
  export stream="/Users/riteshkumarchaurasia/Movies/Stream"
  echo "Setting base folder: $stream"
fi

docker run -it \
  -v "$stream:$stream" \
  -e "INPUT_FILE=$INPUT_FILE" \
  -e "OUTPUT_FILE=$OUTPUT_FILE" \
  -e "OPTIONS=$OPTIONS" \
  -e "INSPECT=$INSPECT" \
  --name $container \
  $image:$tag
