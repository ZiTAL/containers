#!/bin/bash
source version.sh
#FILE="docker-compose.yml"
FILE="docker-compose-2.yml"
COMMAND="podman"
COMMAND_COMPOSE="podman-compose"

${COMMAND} volume create mediawiki-volume-${MEDIAWIKI_VF}
MVS=${MEDIAWIKI_VS} MVF=${MEDIAWIKI_VF} ${COMMAND_COMPOSE} -f ${FILE} build --no-cache
