#!/bin/bash

SYSTEM_TESTS_ENABLED=no

[[ -r system-tests.properties ]] && source system-tests.properties

if [[ "$SYSTEM_TESTS_ENABLED" = "yes" ]]; then
	echo system tests are enabled
else
	echo system tests are disabled
	exit 0
fi

function failure() {
	echo SYSTEM TESTS FAILED:  $@
	exit 1
}

echo add_color_set
curl --silent 'http://localhost:2750/add_color_set/obc:d6bb09f56243f0e43094aa44f48d42f773763ee411bee8e1e4faa9ac03157056:0:0,obc:b1586cd10b32f78795b86e9a3febe58dcb59189175fad884a7f4a6623b77486e:0:0/orange,yellow' |
	grep --quiet 'd2c626205c7e6576230beb705536b6b1bd46aa3bdfd61cbcb51b8e9eba525556' ||
	failure 'add_color_set expected to see d2c6' 

echo get_color_set
curl --silent 'http://localhost:2750/get_color_set/d2c626205c7e6576230beb705536b6b1bd46aa3bdfd61cbcb51b8e9eba525556' |
	grep --quiet 'd6bb09f56243f0e43094aa44f48d42f773763ee411bee8e1e4faa9ac03157056' ||
	failure 'get_color_set d2c6 expected to see d6bb' 



echo SYSTEM TESTS SUCCEEDED



