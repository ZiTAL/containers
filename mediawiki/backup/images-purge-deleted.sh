#!/bin/bash
SCRIPT_PATH="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_PATH}/.."
source ${SOURCE_DIR}/env.sh

CONTAINER="${NAME}-php-${MEDIAWIKI_VF}"

read -p "Are you sure to purge deleted images ? y/n: " input

if [[ "$input" != "y" ]]; then
    echo "Aborted"
    exit 0
fi

echo ""
echo "starting container..."
echo ""

${COMMAND} start ${CONTAINER}

echo "purging deleted images..."
echo ""

${COMMAND} exec ${CONTAINER} php maintenance/deleteArchivedFiles.php --delete

echo "Done."

exit 0
