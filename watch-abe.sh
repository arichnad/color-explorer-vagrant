#!/bin/bash

exec vagrant ssh -c 'tail -f ~/stack/bitcoin-abe-color-explorer/bitcoin-abe-log.txt'

