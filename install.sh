#!/bin/bash

set -e

umount /vagrant #see this bug: https://bugs.launchpad.net/ubuntu/+bug/1239417

if [ -e '/provisioned' ]; then
	echo assuming this system has been set up
	echo starting bitcoind and bitcoin-abe
	sudo -uvagrant -i bash -c '
		./start-bitcoind.sh && nohup ./start-bitcoin-abe.sh &
	'
	exit 0
fi
touch /provisioned

apt-get update
apt-get install --no-install-recommends --yes git bitcoind python python-crypto python-virtualenv
apt-get --yes --purge remove bash-completion

sudo -uvagrant -i bash <<END
	set -e
	
	mkdir .bitcoin && chmod go= .bitcoin
	python -c 'print "rpcuser=bitcoinrpc";import uuid;print "rpcpassword="+str(uuid.uuid4())+"-"+str(uuid.uuid4())' >~/.bitcoin/bitcoin.conf
	
	git clone https://github.com/bitcoinx/ngcccbase.git
	git clone https://github.com/arichnad/bitcoin-abe-color-explorer.git
	cd bitcoin-abe-color-explorer/Abe/htdocs
	git clone https://github.com/arichnad/bitcoin-tx-spent-db-abe.git color-explorer
END

