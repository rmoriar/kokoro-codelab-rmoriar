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

# Install test dependencies
pip3 install ansible molecule[docker] docker yamllint ansible-lint
# Create a custom config file
echo "# Sample custom config" > ~/custom_config.conf
# Create an addional config directory
mkdir ~/plugins; touch ~/plugins/custom_config.conf
for i in {"install_agent", "uninstall_agent"}
do
  for j in {"monitoring", "logging", "ops-agent"}
  do
    if (j == "monitoring")
    then
      for k in {"latest", "6.*.*", "6.1.0"}
      do
        AGENT_TYPE=j; VERSION=k; MAIN_CONFIG_FILE='~/custom_config.conf'; ADDITONAL_CONFIG_DIR='~/plugins/';  molecule test -s i
      done
    if (j == "logging")
    then
      for k in {"latest", "1.*.*", "1.7.0"}
      do
        AGENT_TYPE=j; VERSION=k; MAIN_CONFIG_FILE='~/custom_config.conf'; ADDITONAL_CONFIG_DIR='~/plugins/';  molecule test -s i
      done
    if (j == "ops-agent")
    then
      for k in {"latest", "1.*.*", "1.0.1"}
      do
        AGENT_TYPE=j; VERSION=k; MAIN_CONFIG_FILE='~/custom_config.conf'; ADDITONAL_CONFIG_DIR='~/plugins/';  molecule test -s i
      done
  done
done


