#!/bin/bash

set -e

renice +20 -p $$ >/dev/null
ionice -n7 -p $$

cd ~/stack/bitcoin-abe-color-explorer/

#strace -ostrace.txt -s200
python -m Abe.abe --config abe.conf >bitcoin-abe-log.txt 2>&1 &

