#!/bin/bash

exec vagrant ssh -c '
blockExplorerCount=$(wget -q -O- "http://blockexplorer.com/q/testnet/getblockcount")
echo block count: $(bitcoind getblockcount) / $blockExplorerCount
'

