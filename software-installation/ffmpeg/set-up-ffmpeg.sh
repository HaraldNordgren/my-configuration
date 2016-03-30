#!/bin/bash

sudo apt-get install libx264-dev
# Install "libmp3lame", probably libmp3lame-dev

# Installing libx265 (Download these files and run dpkg)
sudo dpkg -i libx265-68_1.8-6_amd64.deb
sudo dpkg -i libx265-dev_1.8-6_amd64.deb

git clone https://github.com/FFmpeg/FFmpeg
cd FFmpeg

# gpl is required for libx264
./configure --enable-libmp3lame --enable-gpl --enable-libx264  --enable-libx265
# Add --enable-shared to be able link libavformat when compiling vlc from source

make -j 3
sudo make install
