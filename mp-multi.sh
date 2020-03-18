#!/bin/sh
mp-init-common.sh multi
multipass exec mporacc oraccuser.sh
multipass exec mporacc cp -f mporacc/mp-oraccenv.multi oracc/
mp-boot-common.sh
