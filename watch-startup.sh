#!/bin/bash

echo you must hit CTRL-C *twice* to exit

exec vagrant ssh -c 'tail -f ~/startup-watcher.txt'

