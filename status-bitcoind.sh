#!/bin/bash

exec vagrant ssh -c '
blockExplorerCount=$(wget --output-document=- --quiet "http://blockexplorer.com/q/testnet/getblockcount")
echo block count: $(bitcoind getblockcount) / $blockExplorerCount
'

