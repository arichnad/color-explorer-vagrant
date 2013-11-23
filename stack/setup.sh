#!/bin/bash

echo see bug https://bugs.launchpad.net/ubuntu/+bug/1239417
exit 1

set -e

cd /vagrant/stack

cp -r abe.conf start-bitcoind.sh start-bitcoin-abe.sh bitcoin-abe ~

cd

echo sudo umount /vagrant


