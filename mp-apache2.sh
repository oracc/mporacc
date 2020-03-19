#!/bin/sh
#
# Edit apache2 configuration and install Oracc vhost file for Ubuntu 18
# Must be run sudo

mpname=`uname -n`

if [ "$mpname" == "" ]; then
    echo "$0: must give name of multipass instance on command line"
    exit 1
fi

# Generate the Oracc vhost
sed "s/@@MPNAME@@/$mpname/g" <oracc-vhost.conf.in \
    | sed "s,@@ORACC_BUILDS@@,${ORACC_BUILDS},g" >oracc-vhost.conf

# Copy the Oracc vhost into place
sudo cp oracc-vhost.conf /etc/apache2/sites-enabled/

#
# Edit server name
#
# Is this necessary? /etc/apache2/apache2.conf has ServerName
# build-oracc.museum.upenn.edu on build but no ServerName is given in
# distributed apache2.conf
#

# Get the modules etc linked properly
sudo ./mp-apache2-links.sh

# Stop/start apache with new config
apachectl stop
apachectl start
