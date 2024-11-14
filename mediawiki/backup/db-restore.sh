#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_PATH}/.."
source ${SOURCE_DIR}/env.sh

CONTAINER="${NAME}-mariadb-${MEDIAWIKI_VF}"
DATE=`date +%Y-%m-%d--%H-%M-%S`
BACKUP_DIR="${SCRIPT_PATH}/db"
LAST_FILE="`ls -t1 ${BACKUP_DIR} | grep -E '.sql$' | head -n 1`"
LAST_BACKUP="${BACKUP_DIR}/${LAST_FILE}"

echo "Restore Database:"
echo ""
echo "Last backup: ${LAST_FILE}"
echo ""

read -p "Are you sure to restore this backup ${LAST_FILE} ? y/n: " input

if [[ "$input" != "y" ]]; then
    echo "Aborted"
    exit 0
fi

${COMMAND} exec -i ${CONTAINER} mariadb -u root -e "DROP DATABASE IF EXISTS ${NAME};"
${COMMAND} exec -i ${CONTAINER} mariadb -u root < ${LAST_BACKUP}

echo "Done."

exit 0
