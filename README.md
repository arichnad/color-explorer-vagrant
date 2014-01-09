color-explorer
==============

A vagrant script to set up a VM that sets up these systems:

* arichnad/bitcoin-abe-color-explorer
* arichnad/bitcoin-tx-spent-db-abe (the color explorer)

Usage
-----

* `vagrant up` (wait 15 minutes for VM to provision)
* `./copy-stack.sh` (reboots the system)
* It takes an hour or so for bitcoind to download the blockchain and for abe to scan.
* `./watch-bitcoind.sh`, `./watch-abe.sh`, `./status-bitcoind.sh`, or `./watch-all.sh` (if you'd like to see how things are going)
* back on your host computer, open a browser to:  http://localhost:2750/

Common errors
-------------

If you've created more than one vagrant, you might need to add all of them to your ssh known_hosts file.

Or `ssh-keygen -f ~/.ssh/known_hosts -R '[localhost]:2222'`

License
-------

MIT (see LICENSE file)

More information
----------------

See http://coloredcoins.org/

