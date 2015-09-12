# SaltBox

Small testing environment for SaltStack.

This builds 1 master and 2 minion machines on Vagrant `ubuntu/trusty` box.

State files are under **/srv/salt** and pillar in **/srv/pillar**.

## Running

```bash
$ vagrant up
==> master: Importing base box 'ubuntu/trusty64'...
==> master: Matching MAC address for NAT networking...
==> ...
==> ...
==> minion2: -----------------------------
==> minion2:
==> minion2:     SaltBox is ready!
==> minion2:
==> minion2:     Connect to master:
==> minion2:
==> minion2:     $ vagrant ssh master
==> minion2:
==> minion2: -----------------------------
```

Login to master:
```

            #############################
             Sudo (sudo -i) to root and
             try the following commands:

             $ salt '*' test.ping

             $ salt '*' state.highstate

             state files are @ /srv/salt

            #############################

```
