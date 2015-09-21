#!/bin/bash

set -e

## Make sure only root can run the script ##
if [[ $EUID -ne 0 ]]
then
   echo This script must be run as root 1>&2
   echo Run with '"sudo ./add-settings"'
   exit 1
fi

VIMRC=/usr/share/vim/vimrc
BASHRC=$HOME/.bashrc
PROFILE=$HOME/.profile
GCONF=$HOME/.gconf/apps/gnome-terminal

cd settings-data

cat vimrc >> $VIMRC
echo Added settings and mappings to $VIMRC

cat bashrc >> $BASHRC
echo Added settings to $BASHRC

cat profile >> $PROFILE
echo Added '"./"' to $PATH in $PROFILE

cp -p --parents keybindings/%gconf.xml $GCONF
chown $SUDO_USER:$SUDO_USER $GCONF/keybindings
echo Added keybindings to $GCONF