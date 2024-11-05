#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_PATH}/.."
source ${SOURCE_DIR}/env.sh

BACKUP_DIR="${SCRIPT_PATH}/images"
DATE=`date +%Y-%m-%d--%H-%M-%S`
CONTAINER="${NAME}-data-${MEDIAWIKI_VF}"

LAST_BACKUP="${BACKUP_DIR}/`ls -r1 ${BACKUP_DIR} 2>/dev/null | grep -E '.zip$' | head -n 1`"
LAST_HASH=`md5sum $LAST_BACKUP 2>/dev/null | awk '{print $1}'`

echo "Starting container..."
echo ""

${COMMAND} start ${CONTAINER}

echo ""
echo "Backup images:"
echo ""

${COMMAND} exec ${CONTAINER} zip -r -9 "/tmp/images-${DATE}.zip" "/app/images"
${COMMAND} cp ${CONTAINER}:/tmp/images-${DATE}.zip ${BACKUP_DIR}/images-${DATE}.zip
${COMMAND} exec -ti ${CONTAINER} rm -rf /tmp/images-${DATE}.zip
${COMMAND} exec -ti ${CONTAINER} ls /tmp

echo ""
echo "Stopping container..."
echo ""

${COMMAND} stop ${CONTAINER} &> /dev/null

CURRENT_BACKUP="${BACKUP_DIR}/images-${DATE}.zip"
CURRENT_HASH=`md5sum $CURRENT_BACKUP 2>/dev/null | awk '{print $1}'`

echo ""
echo "Last Backup file: ${LAST_BACKUP}"
echo "Last Hash:        ${LAST_HASH}"
echo "Current Hash:     ${CURRENT_HASH}"
echo ""

if [[ "$LAST_HASH" == "$CURRENT_HASH" ]]; then
    echo "Same as last backup, removing it"
    rm $CURRENT_BACKUP
else
    echo "Backup saved at: ${CURRENT_BACKUP}"
fi

echo "Done."

exit 0
