#!/bin/bash
source env.sh
MVS=${MEDIAWIKI_VS} MVF=${MEDIAWIKI_VF} ${COMMAND_COMPOSE} -f ${CONFIG_FILE} up -d
