#!/bin/sh
APT_APPS="deluge vlc gparted piper zsh"
FLATPAK_APPS="com.authy.Authy com.bitwarden.desktop com.getpostman.Postman com.spotify.Client com.viber.Viber"

# first update apt-sources then
# upgrade the current packages
apt-get update
apt-get upgrade -y

# once that's done install apps
# that can be fetched with apt
apt-get update
apt-get install -y $APT_APPS

# install flatpak apps
flatpak install $FLATPAK_APPS

# setup git
git config --global user.name "Isaiah Collins Abetong"
git config --global user.email "isaiahcollins_02@live.com"

# setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
chsh -s $(which zsh)