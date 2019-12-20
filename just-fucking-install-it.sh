#!/bin/bash

if [[ "$(command -v ansible)" == "/usr/bin/ansible" ]]; then
    echo "Removing apt-installed ansible:"
    sudo apt remove ansible
fi
if [[ "$(command -v pip3)" == "" ]]; then
    echo "Installing python3-pip:"
    sudo apt install python3-pip
fi

if [[ "$(command -v ansible)" == "" ]]; then
    echo "Installing Ansible with pip3:"
    sudo pip3 install ansible
fi

if [[ "$(command -v ohai)" == "" ]]; then
    echo "Installing ohai"
    sudo apt install -y software-properties-common ohai libssl-dev
fi

if [[ "$(command -v git-crypt)" == "" ]]; then
    echo "Installing git-crypt..."
    sudo apt install git-crypt

    echo "Running git-crypt unlock..."
    git-crypt unlock
fi

cd "$(dirname "$0")/ansible" || exit
trap 'sudo chown -R "${USER}"."${USER}" ~/.netrc ~/.cache' EXIT
sudo touch ~/.netrc
sudo chown root.root ~/.netrc

sudo ansible-playbook -i inventory "${PLAYBOOK:-playbook.yml}" -e "pwd=${PWD}" -e "actual_home=${HOME}" -e "actual_username=${USER}" $*

# Restore ownership of certain directories
sudo chown -R ${USER}.${USER} $HOME/.gradle

# These are hard to set via Ansible. Do it in a simpler way...
# gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "'<Ctrl>section'"
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "'<Alt><Super>'"
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
