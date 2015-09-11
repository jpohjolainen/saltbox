# SaltBox

Small testing environment for SaltStack.

This builds 1 master and 2 minion machines on Vagrant `ubuntu/trusty` box.

State files are under **/srv/salt** and pillar in **/srv/pillar**.


```

            #############################
             Sudo (sudo -i) to root and
             try the following commands:

             $ salt '*' test.ping

             $ salt '*' state.highstate

             state files are @ /srv/salt

            #############################

```
