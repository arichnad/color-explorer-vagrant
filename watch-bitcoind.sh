#!/bin/bash

exec vagrant ssh -c 'tail -f ~/.bitcoin/testnet3/debug.log'

