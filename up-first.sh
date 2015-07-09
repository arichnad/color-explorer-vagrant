#!/bin/bash

set -e #exit on failure

./up.sh

vagrant halt

./up.sh

echo 'you might want to run this to see the startup status:  ./watch-startup.sh'

