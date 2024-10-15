#!/bin/bash
source env.sh
BACKUP_DIR="backup/images"

echo "Backup images from containers:"
echo ""

echo "backuping images..."
for CONTAINER in "${CONTAINERS[@]}"; do
    podman save -o "${BACKUP_DIR}/${NAME}-${CONTAINER}-${MEDIAWIKI_VF}.tar" "localhost/${NAME}-${CONTAINER}:${MEDIAWIKI_VF}"
done

echo "compressing images..."
for FILE in ${BACKUP_DIR}/*.tar; do
   zip -9 ${FILE}.zip ${FILE}
done

echo "removing tmp files..."
rm -rf ${BACKUP_DIR}/*.tar
echo "Done."

exit 0
