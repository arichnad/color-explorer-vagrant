#!/bin/bash

exec vagrant ssh -c 'tail -f ~/.bitcoin/testnet3/debug.log ~/bitcoin-abe-color-explorer/bitcoin-abe-log.txt ~/startup-watcher.txt'

