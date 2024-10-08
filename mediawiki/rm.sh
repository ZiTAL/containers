#!/bin/bash
source env.sh

echo "STOPPING CONTAINERS:"
for CONTAINER in "${CONTAINERS[@]}"; do
    ${COMMAND} stop ${NAME}-${CONTAINER}-${MEDIAWIKI_VF}
done
echo ""

echo "REMOVING CONTAINERS:"
for CONTAINER in "${CONTAINERS[@]}"; do
    ${COMMAND} rm ${NAME}-${CONTAINER}-${MEDIAWIKI_VF}
done
echo ""

echo "REMOVING VOLUMEN:"
${COMMAND} volume rm ${NAME}_volume-${MEDIAWIKI_VF}
echo ""

echo "REMOVING IMAGES:"
for CONTAINER in "${CONTAINERS[@]}"; do
    ${COMMAND} image rm ${NAME}_${CONTAINER}
done
echo ""

#podman system prune --all --volumes
