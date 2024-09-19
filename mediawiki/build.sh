#!/bin/bash
source env.sh

${COMMAND} volume create mediawiki-volume-${MEDIAWIKI_VF}
MVS=${MEDIAWIKI_VS} MVF=${MEDIAWIKI_VF} ${COMMAND_COMPOSE} -f ${CONFIG_FILE} build --no-cache
