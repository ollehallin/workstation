#!/bin/bash

declare ansible=$(which ansible)
declare ohai=$(which ohai)
if [ "$ansible" == "" -o "$ohai" == "" ]; then
    sudo apt update
    sudo apt install -y python-pip ohai libssl-dev
    sudo -H pip install ansible
fi

cd $(dirname $0)/ansible
sudo ansible-playbook -i inventory playbook.yml -e "actual_username=${USER}" $*

# These are hard to set via Ansible. Do it in a simpler way...
dconf write /org/gnome/settings-daemon/plugins/media-keys/screensaver "'<Ctrl>section'"
dconf write /org/gnome/desktop/wm/preferences/mouse-button-modifier "'<Alt><Super>'"
