#!/bin/bash

set -e

# Make sure only root can run the script
if [[ $EUID -ne 0 ]]
then
   echo This script must be run as root 1>&2
   echo Run with '"sudo ./add-settings"'
   exit 1
fi

VIMRC=/usr/share/vim/vimrc
BASHRC=$HOME/.bashrc
BASH_ALIASES=$HOME/.bash_aliases
PROFILE=$HOME/.profile
GCONF=$HOME/.gconf/apps/gnome-terminal

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
cd $SCRIPTPATH

cat settings-data/vimrc >> $VIMRC
echo Added settings and mappings to $VIMRC

cp settings-data/bashrc $BASHRC
echo Overwrote $BASHRC

cp rc-files/bash_aliases $BASH_ALIASES
echo Overwrote $BASH_ALIASES

cat settings-data/profile >> $PROFILE
echo Added '"./"' to $PATH in $PROFILE

cp -p --parents keybindings/%gconf.xml $GCONF
chown $SUDO_USER:$SUDO_USER $GCONF/keybindings
echo Added keybindings to $GCONF
