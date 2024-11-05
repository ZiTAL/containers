#!/bin/bash
read -p "Are you sure to stop and delete all containers, images, volumes? y/n: " input

if [[ "$input" != "y" ]]; then
    echo "Aborted"
    exit 0
fi

source env.sh
bash db-backup.sh
NAME=${NAME} PORT=${PORT} MVS=${MEDIAWIKI_VS} MVF=${MEDIAWIKI_VF} MEXT=${MEDIAWIKI_EXT} ${COMMAND_COMPOSE} -f ${CONFIG_FILE} down
${COMMAND} image prune -a
${COMMAND} volume prune

exit 0
