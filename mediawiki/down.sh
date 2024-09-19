#!/bin/bash
source env.sh

${COMMAND_COMPOSE} -f ${CONFIG_FILE} down
