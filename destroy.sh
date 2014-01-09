#!/bin/bash

vagrant ssh -c 'sqlite3 bitcoin-abe-color-explorer/abe.sqlite "SELECT color_set,names FROM color_set"'

vagrant destroy

