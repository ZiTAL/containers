#!/bin/bash
source env.sh
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)"
BACKUP_DIR="backup/images"
DATE=`date +%Y-%m-%d--%H-%M-%S`
CONTAINER="${NAME}-data-${MEDIAWIKI_VF}"

echo "Starting container..."
echo ""

${COMMAND} start ${CONTAINER}

echo "Backup images:"
echo ""

${COMMAND} exec ${CONTAINER} zip -r -9 "/tmp/images-${DATE}.zip" "/app/images"
${COMMAND} cp ${CONTAINER}:/tmp/images-${DATE}.zip ${SCRIPT_PATH}/${BACKUP_DIR}/images-${DATE}.zip
${COMMAND} exec -ti ${CONTAINER} rm -rf /tmp/images-${DATE}.zip
${COMMAND} exec -ti ${CONTAINER} ls /tmp

echo "Stopping container..."
echo ""

${COMMAND} stop ${CONTAINER}

echo "Done."

exit 0
