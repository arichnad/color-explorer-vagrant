#!/bin/bash

cd ~/stack

exec 2>&1 >>startup-watcher.txt

#running this twice, first is to catch up, then catch up again.

for ((i=0;i<2;i++)); do

	blockExplorerCount=$(wget --output-document=- --quiet 'http://blockexplorer.com/q/testnet/getblockcount')

	while [[ $(wget --output-document=- --quiet --tries=1 --timeout=2 http://localhost:2750/chain/Testnet/q/getblockcount) -lt $blockExplorerCount ]]; do
		echo bitcoind block count: $(bitcoind getblockcount) / $blockExplorerCount
		echo abe logfile count: $(grep '^block_tx ' ~/stack/bitcoin-abe-color-explorer/bitcoin-abe-log.txt |tail -n1 |cut -f2 -d\  ) / $blockExplorerCount
		echo abe block count: $(wget --output-document=- --quiet --tries=1 --timeout=2 http://localhost:2750/chain/Testnet/q/getblockcount) / $blockExplorerCount
		echo pinging abe
		#keep pinging abe until it is caught up with the blockexplorer.com
		./ping-abe.sh
		sleep 1m
	done

done

sleep 30

echo caught up

#run the system tests:
./run-system-tests.sh


