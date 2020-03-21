#!/bin/sh
if [ "$1" == "" ]; then
    echo "$0: must give name of oracc user on command line. Stop."
    exit 1
fi
printf "%s" $1 >~/oracc/.oraccuser
# Only support MacOs and Linux for now; on Windows use Multipass.
if [ "$uname" = "Linux" ]; then
    oraccgroup=oracc
else
    oraccgroup=staff
fi
printf "%s" $1 >~/oracc/.oraccgroup
