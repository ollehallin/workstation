#!/bin/bash

if [ "$(which ansible)" == "/usr/local/bin/ansible" ]; then
    echo "Removing pip-installed ansible:"
    sudo pip uninstall ansible
fi

if [ "$(which ansible)" == "" -o  "$(which ohai)" == "" ]; then
    grep -q "ppa.launchpad.net/ansible/ansible" /etc/apt/sources.list.d/ansible*.list || {
        echo "Adding APT key for ppa:ansible/ansible:"
        sudo apt install -y software-properties-common
        sudo apt-add-repository -y ppa:ansible/ansible
    }
    sudo apt update
    sudo apt install -y ansible ohai libssl-dev
fi

cd $(dirname $0)/ansible
sudo ansible-playbook --vault-password-file=$HOME/.ansible-vault-password -i inventory ${PLAYBOOK:-playbook.yml} -e "actual_username=${USER}" $*

# These are hard to set via Ansible. Do it in a simpler way...
dconf write /org/gnome/settings-daemon/plugins/media-keys/screensaver "'<Ctrl>section'"
dconf write /org/gnome/desktop/wm/preferences/mouse-button-modifier "'<Alt><Super>'"
dconf write /org/compiz/profiles/unity/plugins/unityshell/show-launcher "'<Super>'"
