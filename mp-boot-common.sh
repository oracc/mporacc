#!/bin/sh
mpname=$1
if [ "$mpname" == "" ]; then
    echo "$0: argument must be osingle or omulti"
    exit 1
fi

## set up paths
multipass exec $mpname mporacc/mp-sudo.sh oracc ./preconfig.sh

## build and install oracc software, odoc and osys
multipass exec $mpname mporacc/mp-exec.sh oracc ./lnx-config.sh

## install Oracc boot projects
multipass exec $mpname mporacc/mp-exec.sh oracc ./boot-projects.sh

## bring up Apache
multipass exec $mpname mporacc/mp-exec.sh mporacc ./mp-apache2.sh

## Configure default user's profile to load Oracc environment
multipass exec $mpname mporacc/mp-profile.sh

## Configure /etc/hosts on the hosting machine (not the VM);
## (how to do this on a Windows box?)
./mp-etc-hosts.sh

## Configure default user's profile to load Oracc environment
## install Oracc projects from config list, e.g., epsd2
### via oracc serve mechanism?
### or via github repo?
