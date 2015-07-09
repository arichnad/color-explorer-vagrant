#!/bin/bash

exec vagrant ssh -c 'tail -f ~/stack/startup-watcher.txt'

