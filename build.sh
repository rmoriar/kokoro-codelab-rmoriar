#!/bin/bash

# Fail on any error.
set -e

# Install test dependencies.
pyenv global 3.6.1
pip3 install git+https://github.com/ansible-community/ansible-lint.git
sudo pip3 install ansible molecule yamllint
