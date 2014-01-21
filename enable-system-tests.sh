#!/bin/bash

FILE=stack/system-tests.properties

echo enabling system tests
echo to turn off:  "rm $FILE; vagrant ssh -c 'rm system-tests.properties'"

cat >"$FILE" <<END

#use "yes" or "no"
SYSTEM_TESTS_ENABLED=yes

END

