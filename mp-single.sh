#!/bin/sh
mp-init-common.sh mposingle
multipass exec mporacc cp -f mporacc/mp-oraccenv.single oracc/
mp-boot-common.sh mposingle
