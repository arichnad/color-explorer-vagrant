color-explorer
==============

A vagrant script to set up a VM that sets up these systems:

* arichnad/bitcoin-abe-color-explorer
* arichnad/bitcoin-tx-spent-db-abe (the color explorer)

Usage
-----

* `./up-first.sh` (wait 15 minutes for VM to provision, then it will reboot the system)
* It takes an hour or two for bitcoind to download the blockchain and for abe to scan.
* `./watch-bitcoind.sh`, `./watch-abe.sh`, `./status-bitcoind.sh`, `./watch-all.sh`, or `./watch-startup.sh`

If you'd like to see how things are going.

Note:  these scripts require you to hit CTRL-C *twice* to exit them.

* back on your host computer, open a browser to:  http://localhost:2750/


You might want to put something like this in your crontab: `@reboot cd ~/CHECKOUT-DIRECTORY/ && ./up.sh >/dev/null 2>&1`

System tests
------------

* `./enable-system-tests.sh` before running anything.
* After the system boots and the blockchain is downloaded, the system tests will automatically run.
* Run something like this:  `vagrant ssh -c 'tail startup-watcher.txt'`
* Whether or not you enabled system tests before startup, you can always use `./enable-system-tests.sh` and `./run-system-tests.sh` after the system is done downloading the blockchain (`./watch-startup.sh`)


Starting over
-------------

`./destroy.sh` (will print out the colors the server knows about if any and destroy the VM)

License
-------

MIT (see LICENSE file)

More information
----------------

See http://coloredcoins.org/

