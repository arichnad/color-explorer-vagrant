#!/bin/bash

set -e #exit on failure

#see this bug: https://bugs.launchpad.net/ubuntu/+bug/1252872
#This script can be removed after this bug is fixed.

scp -P2222 -pr -i ~/.vagrant.d/insecure_private_key stack/* vagrant@localhost:.

vagrant ssh -c 'cp -a ~/abe.conf ~/bitcoin-abe-color-explorer/'

vagrant reload

