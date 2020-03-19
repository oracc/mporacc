#!/bin/sh
#
# Edit apache2 configuration and install Oracc vhost file for Ubuntu 18

# Add ServerName to apache2.conf
sudo ./mp-apache2-conf.plx

mpname=`uname -n`

if [ "$mpname" == "" ]; then
    echo "$0: must give name of multipass instance on command line"
    exit 1
fi

# Generate the Oracc vhost
sed "s/@@MPNAME@@/$mpname/g" <oracc-vhost.conf.in \
    | sed "s,@@ORACC_BUILDS@@,${ORACC_BUILDS},g" >oracc-vhost.conf

# Remove the default host setup and copy the Oracc vhost into place
sudo rm -f /etc/apache2/sites-enabled/000-default.conf
sudo cp oracc-vhost.conf /etc/apache2/sites-enabled/

# Get the modules etc. linked properly
sudo ./mp-apache2-links.sh

# Stop/start apache with new config
sudo apachectl stop
sudo apachectl start
