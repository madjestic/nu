#!/bin/sh

./site clean
LANG=en_US.utf8 ./site build
./site watch
