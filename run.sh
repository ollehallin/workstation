#!/bin/bash

declare ansible=$(which ansible)
declare ohai=$(which ohai)
if [ "$ansible" == "" -o "$ohai" == "" ]; then
    sudo apt update
    sudo apt install -y python-pip ohai
    sudo -H pip install ansible
fi

cd $(dirname $0)/ansible
ansible-galaxy install franklinkim.docker
ansible-playbook -i inventory playbook.yml $*
