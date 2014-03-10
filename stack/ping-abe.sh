#!/bin/bash

#tells abe to checkout bitcoind for new data!

wget --output-document=/dev/null --quiet -t1 --timeout=1 'http://localhost:2750/chain/Testnet'

