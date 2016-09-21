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
    ./run.sh [ansible-playbook args]

`run.sh` is a wrapper that

1. Uses `apt` to install `pip`, `ansible` and `ohai` if needed.
1. Invokes `ansible-playbook` with the correct arguments.

Do `man ansible-playbook` for more info.

### Tags

The following tags are defined:

- docker
- docker-engine
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

## Third-party roles from ansible-galaxy
The third-party roles that are needed are defined by `ansible/requirements.yml`

When a new role is needed, do like this:

1. `cd ansible`
1. Edit `requirements.yml`
1. `ansible-galaxy install -r requirements.yml`
1. `git add roles/`
1. `git commit`

_Pull Requests are welcome!_
