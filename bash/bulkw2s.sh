#!/bin/sh
# bagus@ep.its.ac.id

# convert wav to raw
for file in *.wav
do
  wav2raw +s $file
done

# convert raw to .short
for file in *.raw
do
  x2x +s $file > ${file%.raw}.short
done
