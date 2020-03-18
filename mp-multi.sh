#!/bin/sh
mp-init-common.sh multi
multipass exec mposingle oraccuser.sh
multipass exec mposingle cp -f mposingle/mp-oraccenv.multi oracc/oraccenv.sh
mp-boot-common.sh
