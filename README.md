# Configure my personal workstation (aka _dotfiles_)

This is not a normal dotfiles project, since it does not care about e.g., .bashrc, .profile and such files.

It concentrates on stuff that is difficult to handle for reasons such as

- Not present in standard Ubuntu channel
- The standard Ubuntu channel is lagging
- Is not packaged as a .deb
- Is inconvenient to get in one command

## Goal

It installs the following tools on my Ubuntu (16.10+) workstation:

- Ansible (standard Ubuntu channel is lagging)
- VirtualBox (custom APT source)
- Vagrant (convenience)
- Docker, Docker Machine, Docker Compose (custom APT source, missing .debs)
- OpenJDK 8 (convenience)
- Emacs (convenience)
- Intellij (missing .debs)
- Fish (convenience)
- AWS CLI (convenience)
- Heroku Toolbox (custom APT source)
- Calibre e-book library manager (with support for emailing to my Kindle)
- Spotify (custom APT source)
- OpenVPN (with customers' config)
- Charles proxy (with my private license)
- Various standard utilities (convenience)

## How to use

    git clone https://github.com/ollehallin/dotfiles
    cd dotfiles
    ./just-fucking-install-it.sh [ansible-playbook args]

`just-fucking-install-it.sh` is a Bash script that

1. Installs `ansible`, `ohai` and `git-crypt` if needed.
2. Runs `git-crypt unlock` if first time.
3. Invokes `ansible-playbook` with the correct arguments.

Do `man ansible-playbook` for more info.

### git-crypt

Some of the playbooks configures services that use secrets (e.g., my AWS credentials). 
Everything that should be hidden from _your_ eyes is encrypted by means of `git-crypt`.

I store secret stuff in the encrypted file `ansible/vars/secrets.yml` and in some of the files in `ansible/files`.

All variables in `secrets.yml` have names that begin with `secrets.`.

If you fork this project, you'll need to create a new `ansible/vars/secrets.yml` for storing _your_ secrets and do `git-crypt init`.

(Or just remove anything that refers to secrets.)

### Tags

Do `./just-fucking-install-it.sh --list-tags` to see what tags are defined.

To only install e.g., Docker you can use

    ./just-fucking-install-it.sh --tags docker

To skip certain tags you can do e.g.,

    ./just-fucking-install-it.sh --skip-tags virtualbox

## Third-party roles from ansible-galaxy
The third-party roles that are needed are defined by `ansible/requirements.yml`

When a new role is needed, do like this:

1. `cd ansible`
1. Edit `requirements.yml` and add the new role.
1. `ansible-galaxy install -r requirements.yml`
1. `git add roles/`
1. `git commit`

_Pull Requests are welcome!_
