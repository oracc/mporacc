#!/bin/sh

if [ -r ~/orc/bin/oraccenv.sh ]; then
    echo ". ~/orc/bin/oraccenv.sh"  >>.profile
elif [ -r /home/oracc/bin/oraccenv.sh ]; then
    echo ". /home/oracc/bin/oraccenv.sh" >>.profile
else
    echo "$0: no ~/orc/bin/oraccenv.sh or /home/oracc/bin/oraccenv.sh"
    exit 1
fi
