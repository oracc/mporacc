#!/bin/sh
mpname=$1
if [ "$mpname" == "" ]; then
    echo "$0: argument must be osingle or omulti"
    exit 1
fi

## set up paths
multipass exec $mpname sudo oracc/preconfig.sh

## build and install oracc software, odoc and osys
multipass exec $mpname oracc/lnx-config.sh

## install Oracc boot projects
multipass exec $mpname boot-projects.sh

## install Oracc projects from config list, e.g., epsd2
### via oracc serve mechanism?
### or via github repo?
