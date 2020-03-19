#!/bin/sh
#
# Wrapper to make it easier to cd to a directory and run a command using multipass exec
#
cd $1
. oraccenv.sh
$2
