#!/usr/bin/env bash

export DEBIAN_FRONTEND=noninteractive

add-apt-repository ppa:saltstack/salt

apt-get -qq update

echo "Upgrading..."
apt-get -qq -y upgrade >/dev/null 2>&1

echo "Installing salt-master and salt-minion..."

apt-get -qq -y install salt-master salt-minion >/dev/null 2>&1

cat > /etc/salt/master <<EOT
auto_accept: True

file_roots:
  base:
    - /srv/salt

EOT

service salt-master restart

cat > /etc/motd <<EOT
            #############################
             Sudo (sudo -i) to root and
             try the following commands:

             $ salt '*' test.ping

             $ salt '*' state.highstate

             Installing takes some time.

             state files are @ /srv/salt

            #############################


EOT

echo "Master configured."
