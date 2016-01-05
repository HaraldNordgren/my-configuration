#!/bin/bash

git clone https://github.com/FFmpeg/FFmpeg
cd FFmpeg

# Install "libmp3lame", probably libmp3lame-dev
sudo apt-get install libx264-dev

# gpl is required for libx264
./configure --enable-libmp3lame --enable-gpl --enable-libx264

make -j
sudo make install
