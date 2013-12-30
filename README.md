color-explorer
==============

A vagrant script to set up a VM that sets up these systems:

* arichnad/bitcoin-abe-color-explorer
* arichnad/bitcoin-tx-spent-db-abe (the color explorer)

Usage
-----

* `vagrant up` (wait 5 minutes for VM to configure)
* `./copy-stack.sh`
* `./start-bitcoind.sh` (wait 25 minutes for testnet download)
* `./watch-bitcoind.sh` (if you'd like to see how things are going)
* `./start-bitcoin-abe.sh` (wait 45 minutes for the scanning to finish)
* back on your host computer, open a browser to:  http://localhost:2750/

License
-------

MIT (see LICENSE file)

More information
----------------

See http://coloredcoins.org/

