#!/bin/bash

renice +20 -p $$ >/dev/null
ionice -n7 -p $$


exec bitcoind $@

