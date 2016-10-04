#!/bin/bash

declare ansible=$(which ansible)
declare ohai=$(which ohai)
if [ "$ansible" == "" -o "$ohai" == "" ]; then
    sudo apt update
    sudo apt install -y python-pip ohai
    sudo -H pip install ansible
fi

cd $(dirname $0)/ansible
sudo ansible-playbook -i inventory playbook.yml -e "actual_username=${USER}" $*
