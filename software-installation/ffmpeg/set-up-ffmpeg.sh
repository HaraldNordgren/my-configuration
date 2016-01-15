#!/bin/bash

git clone https://github.com/FFmpeg/FFmpeg
cd FFmpeg

#[Install "libmp3lame", probably libmp3lame-dev]

sudo apt-get install libx264-dev

# Installing libx265 (Download these files and run dpkg)
sudo dpkg -i libx265-68_1.8-6_amd64.deb
sudo dpkg -i libx265-dev_1.8-6_amd64.deb

# gpl is required for libx264
./configure --enable-libmp3lame --enable-gpl --enable-libx264  --enable-libx265

make -j 3
sudo make install
