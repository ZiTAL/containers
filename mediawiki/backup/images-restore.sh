#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_PATH}/.."
source ${SOURCE_DIR}/env.sh

CONTAINER="${NAME}-data-${MEDIAWIKI_VF}"
BACKUP_DIR="${SCRIPT_PATH}/images"
LAST_FILE="`ls -r1 ${BACKUP_DIR} | grep -E '.zip$' | head -n 1`"
LAST_BACKUP="${BACKUP_DIR}/${LAST_FILE}"

echo "Restore images:"
echo ""
echo "Last backup: ${LAST_BACKUP}"

echo ""
echo "starting container..."

${COMMAND} start ${CONTAINER}

echo "restoring images..."
echo ""

${COMMAND} cp ${LAST_BACKUP} ${CONTAINER}:/tmp/${LAST_FILE}
${COMMAND} exec ${CONTAINER} unzip -o /tmp/${LAST_FILE} -d /

echo ""
echo "stopping container..."
echo ""

${COMMAND} stop ${CONTAINER}
echo ""

echo "Done."

exit 0
