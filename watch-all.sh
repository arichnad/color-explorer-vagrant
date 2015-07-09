#!/bin/bash

exec vagrant ssh -c 'tail -f ~/.bitcoin/testnet3/debug.log ~/stack/bitcoin-abe-color-explorer/bitcoin-abe-log.txt ~/stack/startup-watcher.txt'

