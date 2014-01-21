#!/bin/bash

FILE=stack/system-tests.properties

echo enabling system tests
echo to turn off:  "rm $FILE; vagrant ssh -c 'rm system-tests.properties'"

cat >"$FILE" <<END

#use "yes" or "no"
SYSTEM_TESTS_ENABLED=yes

#public address:  mqtQH8jxv9LoSo676MsfNqr81FCLbWfjph
TESTNET_PRIVATE_KEY=92b6RYqA2GQXhMCg8YLR73AD2tHFu8ZdnxUjUB3yGn8Tj8iqjKE

END

