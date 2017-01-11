#!/bin/bash

set -e

sudo true 1> /dev/null

function hardlink {
    if [ ! -f $1 ]; then return; fi
    sudo ln -f $1 $2
    sudo chown $USER:$USER $2
    echo "Hardlinked $(basename $1 | sed 's|^\.||') to $2"
}

function symlink {
    if [ ! -d $1 ]; then return; fi
    dest=$2/$(basename $1)
    rm -f $dest
    sudo ln -s $1 $2
    sudo chown $USER:$USER $2
    echo "Symlinked $(basename $1) to $dest"
}


if [[ $(uname -s) == Linux ]]; then
    cd $(dirname $(readlink -f $0))
fi

echo "LINKING CONFIG FILES"
hardlink settings-data/.zshrc $HOME/.zshrc
hardlink settings-data/.vimrc $HOME/.vimrc
#hardlink settings-data/.bashrc $HOME/.bashrc
echo

echo "SETTING GIT CONFIG LINKING REPOSITORIES"
hardlink settings-data/.gitignore $HOME/.gitignore
git config --global --replace-all core.excludesfile ~/.gitignore
git config --global push.default simple
git config --global user.email "haraldnordgren@gmail.com"
git config --global user.name "HaraldNordgren"
echo

if [[ $(uname -s) == Linux ]] && [[ "$(uname -v)" == *"Ubuntu"* ]]; then

    #hardlink settings-data/.bash_aliases $HOME/.bash_aliases

    #PROFILE=$HOME/.profile
    #append settings-data/.profile $PROFILE
    #chown $SUDO_USER:$SUDO_USER $PROFILE

    UBUNTU_VERSION=$(lsb_release -r | awk '{print $2}')

    if [[ $UBUNTU_VERSION == 14.04 ]]; then
        echo "ADDING GCONF KEYBINDINGS"
        GCONF_BASE=$HOME/.gconf
        GCONF=$GCONF_BASE/apps/gnome-terminal
        mkdir -p $GCONF
        cp -p --parents keybindings/%gconf.xml $GCONF
        echo "Log in and out to reload Gconf"
        echo

        APT="apt-get"

    elif [[ $UBUNTU_VERSION == 16.04 ]]; then
        APT="apt"
    fi

    echo "INSTALLING SOFTWARE PACKAGES"
    sudo $APT update
    sudo $APT install -y qbittorrent vim vlc zsh postgresql
    echo
    
    echo "REMOVING SOFTWARE PACKAGES"
    sudo $APT purge -y apport
    echo

    echo "SETTING UP GNOME KEYRING FOR GIT"
    sudo $APT install -y libgnome-keyring-dev
    cd /usr/share/doc/git/contrib/credential/gnome-keyring
    sudo make 1> /dev/null
    git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
    echo
fi

echo "SUCCESSFULLY INSTALLED CONFIG"

