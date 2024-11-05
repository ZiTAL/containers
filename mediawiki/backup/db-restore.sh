#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_PATH}/.."
source ${SOURCE_DIR}/env.sh

CONTAINER="${NAME}-mariadb-${MEDIAWIKI_VF}"
DATE=`date +%Y-%m-%d--%H-%M-%S`
BACKUP_DIR="${SCRIPT_PATH}/db"
LAST_BACKUP="${BACKUP_DIR}/`ls -r1 ${BACKUP_DIR} | grep -E '.sql$' | head -n 1`"

echo "Restore Database:"
echo ""
echo "Last backup: ${LAST_BACKUP}"

${COMMAND} exec -i ${CONTAINER} mariadb -u root -e "DROP DATABASE ${NAME};"
${COMMAND} exec -i ${CONTAINER} mariadb -u root < ${LAST_BACKUP}

echo "Done."

exit 0
