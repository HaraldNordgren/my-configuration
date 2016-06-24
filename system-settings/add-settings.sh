#!/bin/bash

set -e

sudo true 1> /dev/null

function hardlink {
    sudo ln $1 $2 -f
    sudo chown $USER:$USER $2
    echo "Hardlinked $1"
}

#function append {
#    cat $1 >> $2
#    echo "Appended to $2"
#}


if [[ $(uname -s) == Linux ]]; then
    cd $(dirname $(readlink -f $0))
fi

echo "HARDLINKING CONFIG FILES"
hardlink settings-data/.zshrc $HOME/.zshrc
hardlink settings-data/.vimrc $HOME/.vimrc
echo

echo "SETTING GIT CONFIG"
hardlink settings-data/.gitignore $HOME/.gitignore
git config --global core.excludesfile ~/.gitignore
git config --global user.email "haraldnordgren@gmail.com"
git config --global user.name "HaraldNordgren"
echo

#hardlink settings-data/.bashrc $HOME/.bashrc

if [[ $(uname -s) == Linux ]] && [[ "$(uname -v)" == *"Ubuntu"* ]]; then

    #hardlink settings-data/.bash_aliases $HOME/.bash_aliases

    #PROFILE=$HOME/.profile
    #append settings-data/.profile $PROFILE
    #chown $SUDO_USER:$SUDO_USER $PROFILE

    UBUNTU_VERSION=$(lsb_release -r | awk '{print $2}')

    if [[ $UBUNTU_VERSION == 14.04 ]]; then
        APT="apt-get"

        echo "ADDING GCONF KEYBINDINGS"
        GCONF_BASE=$HOME/.gconf
        GCONF=$GCONF_BASE/apps/gnome-terminal
        mkdir -p $GCONF
        cp -p --parents keybindings/%gconf.xml $GCONF
        #chown $SUDO_USER:$SUDO_USER $GCONF_BASE -R
        echo "Log in and out to reload Gconf"
        echo

    elif [[ $UBUNTU_VERSION == 16.04 ]]; then
        APT="apt"
    fi

    echo "INSTALLING SOFTWARE PACKAGES"
    sudo $APT update
    sudo $APT install -y qbittorrent vim vlc zsh postgresql libgnome-keyring-dev
    echo

    echo "SETTING UP GNOME KEYRING FOR GIT"
    cd /usr/share/doc/git/contrib/credential/gnome-keyring
sudo make
    git config --global credential.helper /usr/share/doc/git/contrib/credential/gnome-keyring/git-credential-gnome-keyring
    echo

    #cd -
fi

echo "SUCCESSFULLY INSTALLED CONFIG"
