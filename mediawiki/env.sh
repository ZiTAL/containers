#!/bin/bash
NAME="mediawiki"
MEDIAWIKI_VF="1.42.3"
MEDIAWIKI_VS="${MEDIAWIKI_VF%.[0-9]*}"
MEDIAWIKI_EXT="REL${MEDIAWIKI_VS//./_}"
COMMAND="podman"
COMMAND_COMPOSE="podman-compose"
CONFIG_FILE="docker-compose.yml"
CONTAINERS=("data" "memcached" "mariadb" "php" "nginx")
PORT=8081

echo $MEDIAWIKI_VS
