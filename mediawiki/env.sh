#!/bin/bash
NAME="mediawiki"
MEDIAWIKI_VS="1.42"
MEDIAWIKI_VF="${MEDIAWIKI_VS}.3"
MEDIAWIKI_EXT="REL${MEDIAWIKI_VS//./_}"
COMMAND="podman"
COMMAND_COMPOSE="podman-compose"
CONFIG_FILE="docker-compose.yml"
#CONFIG_FILE="docker-compose-2.yml"
CONTAINERS=("data" "memcached" "mariadb" "php" "nginx")
PORT=8081

