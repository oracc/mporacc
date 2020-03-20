#!/bin/sh
#
# Wrapper to make it easier to cd to a directory and run a command using multipass exec
#
cd $1
if [ -r oraccenv.sh ]; then
    . ./oraccenv.sh
else
    . ../oracc/oraccenv.sh
fi
$2
