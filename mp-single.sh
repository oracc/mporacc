#!/bin/sh
mp-init-common.sh mposingle
multipass exec mposingle -- cp -f mporacc/mp-oraccenv.single oracc/oraccenv.sh
multipass exec $mpname mporacc/mp-setup.sh
multipass exec mposingle -- mporacc/mp-user.sh `id -un`
mp-boot-common.sh mposingle
multipass exec $mpname mporacc/mp-exec.sh orc git clone https://github.com/oracc/oraccdoc.git doc
