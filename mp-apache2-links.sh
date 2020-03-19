#!/bin/sh
cd /etc/apache2/mods-enabled
ln -sf ../mods-available/cgi.load .
ln -sf ../mods-available/rewrite.load .
