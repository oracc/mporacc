#!/bin/sh
mp-init-common.sh mposingle
multipass exec mposingle -- cp -f mporacc/mp-oraccenv.single oracc/oraccenv.sh
mp-boot-common.sh mposingle
