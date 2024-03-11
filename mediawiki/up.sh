#!/bin/bash
FILE="docker-compose.yml"
COMMAND="podman-compose"

${COMMAND} -f ${FILE} up