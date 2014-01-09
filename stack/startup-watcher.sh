#!/bin/bash

exec 2>&1 >>~/startup-watcher.txt

blockExplorerCount=$(wget -q -O- 'http://blockexplorer.com/q/testnet/getblockcount')

while [[ $(bitcoind getblockcount) -lt $blockExplorerCount ]]; do
	echo block count: $(bitcoind getblockcount) / $blockExplorerCount
	echo pinging abe
	#keep pinging abe until bitcoind is caught up with block explorer
	./ping-abe.sh
	sleep 30
done

echo caught up

