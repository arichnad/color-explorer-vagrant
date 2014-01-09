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

Common errors
-------------

If you've created more than one vagrant, you might need to add all of them to your ssh known_hosts file.

Or `ssh-keygen -f ~/.ssh/known_hosts -R '[localhost]:2222'`

Starting over
-------------

`./destroy.sh` (will print out the colors the server knows about if any and destroy the VM)

License
-------

MIT (see LICENSE file)

More information
----------------

See http://coloredcoins.org/

