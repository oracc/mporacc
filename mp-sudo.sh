#!/bin/sh
#
# Wrapper to make it easier to cd to a directory and sudo a command using multipass exec
#
cd $1
. oraccenv.sh
sudo $2
