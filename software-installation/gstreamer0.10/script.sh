#!/bin/bash

sudo apt-add-repository ppa:mc3man/trusty-media
sudo apt-get update
sudo apt-get install gstreamer0.10-ffmpeg


#*Please note that if using this ppa I would *not* try upgrading to 14.10/15.04, ect. Do a fresh install instead. The intent here is just for users wishing to stay on 14.04*

#If upgrading releases anyway use ppa-purge *First* -
#sudo ppa-purge  ppa:mc3man/trusty-media

