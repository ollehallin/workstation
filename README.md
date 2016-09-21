# Configure my personal workstation

Installs the following tools on my Ubuntu (16.04+) workstation:

- Ansible
- VirtualBox
- Vagrant
- Docker, Docker Machine, Docker Compose
- OpenJDK 8
- Emacs
- Fish

## How to use

    git clone https://github.com/ollehallin/workstation
    cd workstation
    ./run.sh [ansible args]

`run.sh` is a wrapper for running `ansible-playbook` with the correct arguments.

Do `man ansible-playbook` for more info.

### Tags

The following tags are defined:
- docker
- docker-machine
- docker-compose
- java
- virtualbox
- vagrant
- misc
- shell
- editor

To only install e.g., Docker & OpenJDK you can use

    ./run.sh --tags docker,java

To skip certain tags you can do e.g.,

    ./run.sh --skip-tags virtualbox,shell

_Pull Requests are welcome!_
