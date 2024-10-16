#!/bin/bash
NAME="mediawiki"
MEDIAWIKI_VS="1.42"
MEDIAWIKI_VF="${MEDIAWIKI_VS}.3"
COMMAND="podman"
COMMAND_COMPOSE="podman-compose"
CONFIG_FILE="docker-compose.yml"
CONTAINERS=("data" "memcached" "mariadb" "php" "nginx")
PORT=8081
