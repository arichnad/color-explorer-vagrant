#!/bin/bash

set -e

if [ -e '/provisioned' ]; then exit 0; fi
touch /provisioned

apt-get update
apt-get install --no-install-recommends --yes git bitcoind python python-crypto python-virtualenv
sudo apt-get --yes --purge remove bash-completion

sudo -uvagrant -i bash -c '
	git clone https://github.com/bitcoinx/ngcccbase.git &&
	git clone https://github.com/arichnad/bitcoin-abe.git &&
	cd bitcoin-abe/Abe/htdocs &&
	git clone https://github.com/arichnad/bitcoin-tx-spent-db-abe.git color-explorer
'

