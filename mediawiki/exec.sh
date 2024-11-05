#!/bin/bash
# use: bash exec.sh data
# use: bash exec.sh php
# use: bash exec.sh nginx
# use: bash exec.sh mariadb
# use: bash exec.sh memcached

source env.sh
${COMMAND} exec -it ${NAME}-$1-${MEDIAWIKI_VF} /bin/sh
