#!/bin/bash

set -e

function overwrite {
    cp $1 $2
    chown $SUDO_USER:$SUDO_USER $2
    echo "Overwrote $2"
}

function append {
    cat $1 >> $2
    echo "Appended to $2"
}

# Make sure only root can run the script
if [[ $EUID -ne 0 ]]
then
   echo "Must run as root!" 1>&2
   exit 1
fi

SCRIPT=$(readlink -f $0)
cd $(dirname $SCRIPT)

#HOME="$PWD/test"
BASHRC=$HOME/.bashrc
BASH_ALIASES=$HOME/.bash_aliases
PROFILE=$HOME/.profile
VIMRC=/etc/vim/vimrc
GCONF_BASE=$HOME/.gconf
GCONF=$GCONF_BASE/apps/gnome-terminal

overwrite settings-data/bashrc $BASHRC
overwrite settings-data/bash_aliases $BASH_ALIASES
append settings-data/profile $PROFILE
chown $SUDO_USER:$SUDO_USER $PROFILE
append settings-data/vimrc $VIMRC

mkdir -p $GCONF
cp -p --parents keybindings/%gconf.xml $GCONF
chown $SUDO_USER:$SUDO_USER $GCONF_BASE -R
echo "Added keybindings to $GCONF"
