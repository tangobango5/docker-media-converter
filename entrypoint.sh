#!/bin/bash

# ENV
# INPUT_FILE
# OUTPUT_FILE
# OPTIONS
# stream
# INSPECT

cd $stream

if [[ $OPTIONS ]];
then
  echo "Setting options: $OPTIONS"
else
  export OPTIONS="-c copy -map 0"
  OPTIONS="-c copy -map 0"
  echo "Using default options: $OPTIONS"
fi

rm -rf $OUTPUT_FILE
echo "Runing: ffmpeg -err_detect ignore_err -y -i  \"$INPUT_FILE\" $OPTIONS \"$OUTPUT_FILE\""

if [[ $INSPECT ]];
then
  ffmpeg -i "$INPUT_FILE"
else
  ffmpeg -err_detect ignore_err -y -i "$INPUT_FILE" $OPTIONS "$OUTPUT_FILE"
fi
