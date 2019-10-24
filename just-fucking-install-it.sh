#!/bin/bash

if [[ "$(command -v ansible)" == "/usr/local/bin/ansible" ]]; then
    echo "Removing pip-installed ansible:"
    sudo pip uninstall ansible
fi

if [[ "$(grep ppa.launchpad.net/ansible/ansible /etc/apt/sources.list.d/ansible*.list | grep -Ev '#\s*deb')" == "" ]] || [[ "$(command -v ohai)" == "" ]]; then
    echo "Adding APT key for ppa:ansible/ansible:"
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt update
    sudo apt install -y software-properties-common ansible ohai libssl-dev
fi

if [[ "$(command -v git-crypt)" == "" ]]; then
    echo "Installing git-crypt..."
    sudo apt install git-crypt

    echo "Running git-crypt unlock..."
    git-crypt unlock
fi

cd "$(dirname "$0")/ansible" || exit
touch ~/.netrc
sudo chown root.root ~/.netrc
sudo ansible-playbook -i inventory "${PLAYBOOK:-playbook.yml}" -e "pwd=${PWD}" -e "actual_home=${HOME}" -e "actual_username=${USER}" $*
sudo chown "${USER}"."${USER}" ~/.netrc
sudo chown -R "${USER}"."${USER}" ~/.cache

# These are hard to set via Ansible. Do it in a simpler way...
# gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "'<Ctrl>section'"
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "'<Alt><Super>'"
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
