#!/bin/sh

devmem 0xa0040028 8 0
devmem 0xa0040030 8 128
devmem 0xa0040038 8 178

modetest -D a0040000.v_mix -s 36@34:1024x768@BG24
