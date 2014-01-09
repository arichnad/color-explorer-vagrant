#!/bin/bash

#tells abe to checkout bitcoind for new data!

wget -q -t1 --timeout=1 'http://localhost:2750/chain/Bitcoin'

