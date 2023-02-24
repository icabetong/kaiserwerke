#!/bin/bash
APT_APPS="deluge vlc gparted piper zsh"
FLATPAK_APPS="com.authy.Authy com.bitwarden.desktop com.getpostman.Postman com.spotify.Client com.viber.Viber"

if [ "$EUID" -ne 0 ]
  then echo -e "\nThis script needs to run with root privileges.\nExiting..."
  exit
fi

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

# install vscode
sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg