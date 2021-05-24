#!/bin/bash

# Fail on any error.
set -e

# Display commands being run.
# WARNING: please only enable 'set -x' if necessary for debugging, and be very
#  careful if you handle credentials (e.g. from Keystore) with 'set -x':
#  statements like "export VAR=$(cat /tmp/keystore/credentials)" will result in
#  the credentials being printed in build logs.
#  Additionally, recursive invocation with credentials as command-line
#  parameters, will print the full command, with credentials, in the build logs.
# set -x
# sudo apt-get update -y
#pyenv global 3.6.1
#pip install git+https://github.com/ansible-community/ansible-lint.git
# Install test dependencies
# Create a custom config file
pyenv global 3.6.1
sudo pip install git+https://github.com/ansible-community/ansible-lint.git
sudo pip install ansible molecule yamllint
