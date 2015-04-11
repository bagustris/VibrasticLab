#!/bin/sh
for file in *.wav
do
  sox -t wav $file -r 8000 -c 1 ${file%.wav}.8kHz.wav resample
done
