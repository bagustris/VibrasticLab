#!/bin/bash
# resample 48k to 16k using sox
# for 24 bit to 16, use: "-b 16""
if [ ! -d converted/ ]; then
	mkdir converted/
fi
for i in ./*.wav;\
	do sox -S "$i" -r 16000 "converted/${i%.wav}_16k.wav";\
done 
