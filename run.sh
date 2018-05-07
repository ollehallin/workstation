#!/bin/bash

if [ "$(which ansible)" == "/usr/local/bin/ansible" ]; then
    echo "Removing pip-installed ansible:"
    sudo pip uninstall ansible
fi

if [ "$(grep ppa.launchpad.net/ansible/ansible /etc/apt/sources.list.d/ansible*.list)" == "" -o  "$(which ohai)" == "" ]; then
    echo "Adding APT key for ppa:ansible/ansible:"
    sudo apt-add-repository -y ppa:ansible/ansible
    sudo apt update
    sudo apt install -y software-properties-common ansible ohai libssl-dev
fi

if [ "$(which git-crypt)" == "" ]; then
    echo "Installing git-crypt..."
    sudo apt install git-crypt
fi

cd $(dirname $0)/ansible
touch ~/.netrc
sudo chown root.root ~/.netrc
sudo ansible-playbook -i inventory ${PLAYBOOK:-playbook.yml} -e "pwd=${PWD}" -e "actual_username=${USER}" $*
sudo chown ${USER}.${USER} ~/.netrc

# These are hard to set via Ansible. Do it in a simpler way...
# gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "'<Ctrl>section'"
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "'<Alt><Super>'"
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,maximize,minimize:'
