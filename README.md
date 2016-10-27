# Configure my personal workstation (aka _dotfiles_)

This is not a normal dotfiles project, since it does not care about e.g., .bashrc, .profile and such files.

It concentrates on stuff that is difficult to handle for reasons such as

- Not present in standard Ubuntu channel
- The standard Ubuntu channel is lagging
- Is not packaged as a .deb
- Is convenient to get in one command

## Goal

It installs the following tools on my Ubuntu (16.04+) workstation:

- Ansible (reason: standard Ubuntu channel is lagging)
- VirtualBox (custom APT source)
- Vagrant (convenience)
- Docker, Docker Machine, Docker Compose (custom APT source, missing .debs)
- OpenJDK 8 (convenience)
- Emacs (convenience)
- Fish (convenience)
- AWS CLI


## How to use

    git clone https://github.com/ollehallin/workstation
    cd workstation
    ./run.sh [ansible-playbook args]

`run.sh` is a wrapper that

1. Uses `apt` to install `pip`, `ansible` and `ohai` if needed.
1. Invokes `ansible-playbook` with the correct arguments.

Do `man ansible-playbook` for more info.

### Tags

Do `./run.sh --list-tags` to see what tags are defined.

To only install e.g., Docker & OpenJDK you can use

    ./run.sh --tags docker,compilers

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
