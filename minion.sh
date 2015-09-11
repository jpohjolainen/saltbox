#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

add-apt-repository ppa:saltstack/salt

echo "Updating..."
apt-get -qq update

echo "Upgrading..."
apt-get -qq -y upgrade >/dev/null 2>&1

echo "10.10.10.10 salt" >> /etc/hosts

echo "Installing salt-minion..."
apt-get -qq -y install salt-minion >/dev/null 2>&1

echo "Minion configured."
