#!/bin/bash
source env.sh

#${COMMAND} volume create ${NAME}-volume-${MEDIAWIKI_VF}
NAME=${NAME} PORT=${PORT} MVS=${MEDIAWIKI_VS} MVF=${MEDIAWIKI_VF} ${COMMAND_COMPOSE} -f ${CONFIG_FILE} build --no-cache
