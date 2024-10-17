#!/bin/bash
source env.sh
CONTAINER="${NAME}-mariadb-${MEDIAWIKI_VF}"
DATE=`date +%Y-%m-%d--%H-%M-%S`
BACKUP_DIR="backup/db"
LAST_BACKUP="${BACKUP_DIR}/`ls -r1 ${BACKUP_DIR} | grep .sql$ | head -n 1`"

echo "Restore Database:"
echo ""
echo "Last backup: ${LAST_BACKUP}"

${COMMAND} exec ${CONTAINER} mariadb --user=root < ${LAST_BACKUP}

echo "Done."

exit 0
