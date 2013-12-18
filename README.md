color-explorer
==============

A vagrant script to set up a VM that sets up these systems:

* arichnad/bitcoin-abe-color-explorer
* arichnad/bitcoin-tx-spent-db-abe (the color explorer)

The Bug
-------

* See this bug:  https://bugs.launchpad.net/ubuntu/+bug/1239417
Many of the sections under "usage" can be removed after this bug is fixed.

Usage
-----

* `vagrant up`
* `tar -C stack -cf stack.tar .` (see "bug" above)
* `scp -P2222 -i ~/.vagrant.d/insecure_private_key stack.tar vagrant@localhost:.` (see "bug" above)
* `rm stack.tar` (see "bug" above)
* `vagrant ssh`
* `tar -xf stack.tar` (see "bug" above)
* `./start-bitcoind.sh` (follow the instructions regarding setting up the config file)
* `./start-bitcoind.sh` (wait 25 minutes for testnet download)
* `tail -f ~/.bitcoin/testnet3/debug.log` (if you'd like to see how things are going)
* `./start-bitcoin-abe.sh` (wait 45 minutes for the scanning to finish)
* back on your host computer, open a browser to:  http://localhost:2750/

License
-------

MIT (see LICENSE file)

More information
----------------

See http://coloredcoins.org/

