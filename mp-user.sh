#!/bin/sh
if [ "$1" == "" ]; then
    echo "$0: must give name of oracc user on command line. Stop."
    exit 1
fi
printf "%s" $1 >~/oracc/.oraccuser
