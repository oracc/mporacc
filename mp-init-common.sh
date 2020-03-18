#!/bin/sh
mpname=$1
if [ "$mpname" == "" ]; then
    echo "$0: argument must be osingle or omulti"
    exit 1
fi
multipass launch --name $mpname --mem 8G --[DISK] 120G
multipass exec $mpname apt-add-repository universe
multipass exec $mpname apt-add-repository multiverse
multipass exec $mpname apt upgrade
multipass exec $mpname git install https://github.com/oracc/mporacc.git
multipass exec $mpname git install https://github.com/oracc/oracc.git
multipass exec $mpname git install https://github.com/oracc/odoc.git
multipass exec $mpname git install https://github.com/oracc/osys.git
multipass exec $mpname oracc/pkg-unbuntu18.sh
multipass exec $mpname oracc/perl-modules.sh
multipass exec $mpname oracc/force-bash.sh
