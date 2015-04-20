#!/bin/sh
for file in *.wav
do
  sox -t wav $file -r / -c 1 ${file%.wav}.8kHz.wav resample
done
