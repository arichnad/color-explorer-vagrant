#!/bin/bash

set -e #exit on failure

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
add-apt-repository -y ppa:bitcoin/bitcoin
apt-get update --yes
#apt-get dist-upgrade --yes  #won't let the script exit.

echo '### installing packages ###'
apt-get install --no-install-recommends --yes git bitcoind python python-crypto python-virtualenv sqlite3
apt-get --yes --purge remove bash-completion

echo '### creating a swapfile ###'
dd if=/dev/zero of=/swapfile bs=1M count=1024
chmod go= /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile swap swap defaults 0 0' >>/etc/fstab

#ln --symbolic /vagrant/stack /home/vagrant/stack
cp --recursive --preserve=all /vagrant/stack /home/vagrant/stack

sudo -uvagrant -i bash <<END
	set -e #exit on failure
	
	username=\$(tr -dc A-Za-z0-9 </dev/urandom |head -c40)
	password=\$(tr -dc A-Za-z0-9 </dev/urandom |head -c40)
	mkdir -p .bitcoin/testnet3 && chmod go= .bitcoin
	echo >~/.bitcoin/bitcoin.conf "
server=1
daemon=1
testnet=1
txindex=1
rpcuser=\$username
rpcpassword=\$password
"
	#bitcoin abe likes to see the file here
	cp ~/.bitcoin/{,testnet3/}bitcoin.conf
		
	cd stack
	echo '### getting github projects ###'
	git clone https://github.com/bitcoinx/ngcccbase.git
	git clone https://github.com/arichnad/bitcoin-abe-color-explorer.git
	cp --preserve=all abe.conf bitcoin-abe-color-explorer
	cd bitcoin-abe-color-explorer/Abe/htdocs
	git clone https://github.com/arichnad/bitcoin-tx-spent-db-abe.git color-explorer

	(
		echo "@reboot ~/stack/start-bitcoind.sh"
		echo "@reboot ~/stack/start-abe.sh"
		echo "@reboot ~/stack/startup-watcher.sh"
		echo "@hourly ~/stack/ping-abe.sh"
	) |crontab -
END

