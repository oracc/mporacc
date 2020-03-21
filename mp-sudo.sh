#!/bin/sh
#
# Wrapper to make it easier to cd to a directory and sudo a command using multipass exec
#
cd $1
shift
ls -l oraccenv.sh
if [ -r oraccenv.sh ]; then
    . ./oraccenv.sh
else
    . ../oracc/oraccenv.sh
fi
sudo $*
