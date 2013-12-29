color-explorer
==============

A vagrant script to set up a VM that sets up these systems:

* arichnad/bitcoin-abe-color-explorer
* arichnad/bitcoin-tx-spent-db-abe (the color explorer)

Usage
-----

* `vagrant up`
* `./copy-stack.sh`
* `vagrant ssh`
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

