#!/bin/bash
source env.sh
CONTAINER="${NAME}-mariadb-${MEDIAWIKI_VF}"
DATE=`date +%Y-%m-%d--%H-%M-%S`
BACKUP_DIR="backup/db"
mkdir -p $BACKUP_DIR

LAST_BACKUP="${BACKUP_DIR}/`ls -r1 ${BACKUP_DIR} 2>/dev/null | grep .sql$ | head -n 1`"
LAST_HASH=`md5sum $LAST_BACKUP 2>/dev/null | awk '{print $1}'`

TMP_BACKUP="${BACKUP_DIR}/tmp.sql"
TARGET_BACKUP="${BACKUP_DIR}/${NAME}-${DATE}.sql"

# remove last line due to date
${COMMAND} exec -it ${CONTAINER} mariadb-dump --databases ${NAME} --add-drop-database --routines --triggers --user=root | head -n -1 > ${TMP_BACKUP}
CURRENT_HASH=`md5sum ${TMP_BACKUP} | awk '{print $1}'`

echo "Backup Database:"
echo ""
echo "Last Backup file: ${LAST_BACKUP}"
echo "Last Hash:        ${LAST_HASH}"
echo "Current Hash:     ${CURRENT_HASH}"
echo ""

if [[ "$LAST_HASH" == "$CURRENT_HASH" ]]; then
    echo "Same as last backup, removing it"
    rm $TMP_BACKUP

else
    mv "${TMP_BACKUP}" "${TARGET_BACKUP}"
    echo "Backup saved at:  ${TARGET_BACKUP}"
fi

echo "Done."

exit 0
