#!/bin/bash
source env.sh
bash db-backup.sh
NAME=${NAME} PORT=${PORT} MVS=${MEDIAWIKI_VS} MVF=${MEDIAWIKI_VF} ${COMMAND_COMPOSE} -f ${CONFIG_FILE} down
