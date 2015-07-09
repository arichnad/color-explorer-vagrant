#!/bin/bash

cd ~/stack

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
	failure 'add_color_set d6bb expected to see d2c6' 

echo get_color_set
curl --silent 'http://localhost:2750/get_color_set/d2c626205c7e6576230beb705536b6b1bd46aa3bdfd61cbcb51b8e9eba525556' |
	grep --quiet 'd6bb09f56243f0e43094aa44f48d42f773763ee411bee8e1e4faa9ac03157056' ||
	failure 'get_color_set d2c6 expected to see d6bb' 

echo add_color_set
curl --silent 'http://localhost:2750/add_color_set/obc:b6a34e1e5a4b3d9d99d40b00c385e1749f2d3c8b6375341f62b2a0ea1f0638a0:0:0,obc:29a597b84f79ae31c43d2cf2b0a35b3e1e8d3f548744d964b3fafa9be315a7dd:0:0/roman0,roman1' |
	grep --quiet '53db57c304ae9e25a3b8911150658dc9360a63d5cf2eb77345a1afc89f90adca' ||
	failure 'add_color_set b6a3 expected to see 53db'

echo get_color_set
curl --silent 'http://localhost:2750/get_color_set/53db57c304ae9e25a3b8911150658dc9360a63d5cf2eb77345a1afc89f90adca' ||
	grep --quiet 'b6a34e1e5a4b3d9d99d40b00c385e1749f2d3c8b6375341f62b2a0ea1f0638a0' ||
	failure 'get_color_set 53db expected to see b6a3'




echo SYSTEM TESTS SUCCEEDED



