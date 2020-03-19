#!/bin/sh
mpname=$1
if [ "$mpname" == "" ]; then
    echo "$0: must give vm name on command line. Stop."
    exit 1
fi
grep -v $mpname /etc/hosts >hosts.tmp
multipass exec $mpname -- hostname -I | tr '\n' '\t' >>hosts.tmp
echo $mpname >>hosts.tmp
sudo mv hosts.tmp /etc/hosts
