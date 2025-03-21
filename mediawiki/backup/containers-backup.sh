#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_PATH}/.."
source ${SOURCE_DIR}/env.sh
BACKUP_DIR="${SCRIPT_PATH}/containers"

echo "Backup containers:"
echo ""

echo "backuping containers..."
for CONTAINER in "${CONTAINERS[@]}"; do
    podman save -o "${BACKUP_DIR}/${NAME}-${CONTAINER}-${MEDIAWIKI_VF}.tar" "localhost/${NAME}-${CONTAINER}:${MEDIAWIKI_VF}"
done

echo "compressing containers..."
for FILE in ${BACKUP_DIR}/*.tar; do
   zip -9 ${FILE}.zip ${FILE}
done

echo "removing tmp files..."
rm -rf ${BACKUP_DIR}/*.tar
echo "Done."

exit 0
