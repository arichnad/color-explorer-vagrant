#!/bin/bash

FILE=stack/system-tests.properties

echo enabling system tests
echo to turn off, delete this file:  $FILE

cat >"$FILE" <<END

#use "yes" or "no"
SYSTEM_TESTS_ENABLED=yes

END

