#!/bin/bash

set -e

function hardlink {
    ln $1 $2 -f
    chown $SUDO_USER:$SUDO_USER $2
    echo "Hardlinked $1"
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

# Go to script directory
SCRIPT=$(readlink -f $0)
cd $(dirname $SCRIPT)

BASHRC=$HOME/.bashrc
BASH_ALIASES=$HOME/.bash_aliases
PROFILE=$HOME/.profile
VIMRC=$HOME/.vimrc
GCONF_BASE=$HOME/.gconf
GCONF=$GCONF_BASE/apps/gnome-terminal

hardlink settings-data/.bashrc $BASHRC
hardlink settings-data/.bash_aliases $BASH_ALIASES
hardlink settings-data/.vimrc $VIMRC
hardlink settings-data/.zshrc $HOME/.zshrc
hardlink settings-data/.gitignore $HOME/.gitignore && git config --global core.excludesfile ~/.gitignore

append settings-data/.profile $PROFILE
chown $SUDO_USER:$SUDO_USER $PROFILE

mkdir -p $GCONF
cp -p --parents keybindings/%gconf.xml $GCONF
chown $SUDO_USER:$SUDO_USER $GCONF_BASE -R
echo "Added keybindings to $GCONF"; echo

echo "Sucessfully installed config!"
echo "Log in and out to reload gconf and profile"
