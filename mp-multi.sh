#!/bin/sh
mp-init-common.sh multi
multipass exec mposingle oraccuser.sh
multipass exec mposingle cp -f mporacc/mp-oraccenv.multi oracc/oraccenv.sh
mp-boot-common.sh
multipass exec $mpname git clone https://github.com/oracc/oraccdoc.git
multipass exec $mpname mporacc/mp-exec.sh oraccdoc oracc build
