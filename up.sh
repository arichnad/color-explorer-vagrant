#!/bin/bash

renice +20 -p $$ >/dev/null
ionice -n7 -p $$

set -e #exit on failure

vagrant up

