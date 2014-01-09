#!/bin/bash

set -e #exit on failure

echo 'info:  attempting to delete localhost:2222 from your known hosts'
ssh-keygen -f ~/.ssh/known_hosts -R '[localhost]:2222' 2>/dev/null

./up.sh

grep -iq '^Host default$' ~/.ssh/config || vagrant ssh-config >> ~/.ssh/config

#see this bug: https://bugs.launchpad.net/ubuntu/+bug/1252872
#This script can be removed after this bug is fixed.

scp -pr stack/* default:.

vagrant ssh -c 'cp -a ~/abe.conf ~/bitcoin-abe-color-explorer/'

vagrant halt
./up.sh

