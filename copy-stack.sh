#!/bin/bash

set -e

#See this bug: https://bugs.launchpad.net/ubuntu/+bug/1239417
#This script can be removed after this bug is fixed.

scp -P2222 -pr -i ~/.vagrant.d/insecure_private_key stack/* vagrant@localhost:.

