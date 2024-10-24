#!/bin/bash
source env.sh
BACKUP_DIR="backup/images"
DATE=`date +%Y-%m-%d--%H-%M-%S`
CONTAINER="${NAME}-data-${MEDIAWIKI_VF}"

echo "Starting container..."

${COMMAND} start ${CONTAINER}

echo "Backup images:"
echo ""

${COMMAND} exec -ti ${CONTAINER} zip -r -9 "/tmp/images-${DATE}.zip" "/app/images"

exit 0
