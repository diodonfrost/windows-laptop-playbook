# windows laptop playbook

[![Build Status](https://travis-ci.org/diodonfrost/windows-laptop-playbook.svg?branch=master)](https://travis-ci.org/diodonfrost/windows-laptop-playbook)

This playbook installs and configures most of the software I use on my windows laptop for Cloud and software development.

## Installation

1.  [Install Ansible](http://docs.ansible.com/intro_installation.html).
2.  Clone this repository to your local drive.
3.  Run 'ansible-galaxy install -r requirements.yml' inside this directory to install required Ansible roles.
4.  Run 'ansible-playbook playbook.yml' inside this directory.

### Running a specific set of tagged tasks

You can filter which part of the provisioning process to run by specifying a set of tags using `ansible-playbook --tags` flag.
The tags available:

-   audio
-   cloud
-   development
-   network

ansible-playbook playbook.yml --tags "cloud,development"

## Overriding Defaults

```yaml
---
# defaults file for windows-laptop-playbook

# Default apps to install
default_packages:
  - chocolatey
  - 7zip
  - keepass
  - dropbox
  - firefox
  - slack

# Audio packages list
audio_install: true
audio_packages:
  - discord
  - spotify
  - vlc

# Cloud packages list
cloud_install: true
cloud_packages:
  - kubernetes-cli
  - awscli
  - gcloudsdk

# Development packages list
development_install: true
development_packages:
  - atom
  - notepadplusplus
  - git
  - gitkraken

# Network packages list
network_install: true
network_packages:
  - kitty
  - winscp
  - wireshark

# Install atom plugins
atom_packages:
  - atom-beautify
  - atom-jinja2
  - atom-material-ui
  - busy-signal
  - git-plus
  - highlight-selected
  - intentions
  - language-ansible
  - language-docker
  - language-chef
  - language-groovy
  - language-puppet
  - language-terraform
  - linter
  - linter-ansible-linting
  - linter-docker
  - linter-erb
  - linter-flake8
  - linter-golinter
  - linter-markdown
  - linter-puppet-lint
  - linter-pylint
  - linter-ruby
  - linter-shellcheck
  - linter-ui-default
  - markdown-preview-plus
  - minimap
  - Sublime-Style-Column-Selection

# Install Python language.
# Default is true.
python_install: true

# Python-pip3 packages to install
python_packages:
  - awscli
```

## Dependencies

None

## Local Testing
The preferred way of locally testing the role is to use Docker. You will have to install Docker on your system. See Get started for a Docker package suitable to for your system.

You can also use vagrant and Virtualbox to run tests locally. You will have to install Virtualbox and Vagrant on your system. See Vagrant Downloads for a vagrant package suitable for your system. For all our tests we use test-kitchen. If you are not familiar with test-kitchen please have a look at their guide.

Next install test-kitchen:
```shell
# Install dependencies
gem install bundler
bundle install
```

### Testing on Windows with Virtualbox

Windows can only be test with Virtualbox provider, do not use 'kitchen test' command for testing Windows environment. There 4 steps you will be using with test-kitchen as part of your workflow.

First of all we must set the kitchen file:
```shell
# For testing Windows on Linux
export KITCHEN_YAML=.kitchen-windows.yml

# For testing Windows on Windows
set KITCHEN_YAML=.kitchen-windows.yml
```

Provision the virtual machines, a Linux machine to run Ansible and Windows machines to apply playbook again:
```shell
# deploy machines
kitchen create

# Launch playbook
kitchen converge
```

Finaly launch inspec tests:
```shell
kitchen verify
```

For cleaning environment use:
```shell
kitchen destroy
```

## License

Apache 2

## Author Information

This role was created in 2018 by diodonfrost.
