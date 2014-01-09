#!/bin/bash

set -e #exit on failure

umount /vagrant #see this bug: https://bugs.launchpad.net/ubuntu/+bug/1252872

if [ -e '/provisioned' ]; then
	echo assuming this system has been set up
	exit 0
fi
touch /provisioned


#provision!

#get rid of all passwords.  they're dumb.
passwd -dq root
passwd -dq vagrant

#firewall
ufw allow ssh/tcp >/dev/null
ufw allow 8333/tcp >/dev/null
ufw allow 2750/tcp >/dev/null
ufw --force enable >/dev/null

echo '### upgrading ubuntu ###'
apt-get update --yes
apt-get dist-upgrade --yes

echo '### installing packages ###'
apt-get install --no-install-recommends --yes git bitcoind python python-crypto python-virtualenv
apt-get --yes --purge remove bash-completion

echo '### creating a swapfile ###'
dd if=/dev/zero of=/swapfile bs=1M count=1024
mkswap /swapfile
swapon /swapfile
echo '/swapfile swap swap defaults 0 0' >>/etc/fstab

sudo -uvagrant -i bash <<END
	set -e #exit on failure
	
	username=\$(tr -dc A-Za-z0-9 </dev/urandom |head -c40)
	password=\$(tr -dc A-Za-z0-9 </dev/urandom |head -c40)
	mkdir .bitcoin && chmod go= .bitcoin
	echo >~/.bitcoin/bitcoin.conf "
server=1
daemon=1
testnet=1
txindex=1
rpcuser=\$username
rpcpassword=\$password
"
		
	echo '### getting github projects ###'
	git clone https://github.com/bitcoinx/ngcccbase.git
	git clone https://github.com/arichnad/bitcoin-abe-color-explorer.git
	cd bitcoin-abe-color-explorer/Abe/htdocs
	git clone https://github.com/arichnad/bitcoin-tx-spent-db-abe.git color-explorer

	(
		echo "@reboot ~/start-bitcoind.sh"
		echo "@reboot ~/start-abe.sh"
		echo "@reboot ~/startup-watcher.sh"
	) |crontab -
END

