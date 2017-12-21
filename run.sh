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

cd $(dirname $0)/ansible
sudo chown root.root ~/.netrc
sudo ansible-playbook --vault-password-file=$HOME/.ansible-vault-password -i inventory ${PLAYBOOK:-playbook.yml} -e "actual_username=${USER}" $*
sudo chown ${USER}.${USER} ~/.netrc

# These are hard to set via Ansible. Do it in a simpler way...
# gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "'<Ctrl>section'"
gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "'<Alt><Super>'"
