#!/bin/bash

set -e

renice +20 -p $$ >/dev/null
ionice -n7 -p $$

cp -a abe.conf bitcoin-abe/

cd bitcoin-abe/

#strace -ostrace.txt -s200
exec python -m Abe.abe --config abe.conf

