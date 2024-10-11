#!/bin/bash
source env.sh
CONTAINER="${NAME}-mariadb-${MEDIAWIKI_VF}"
DB=$NAME
DATE=`date +%Y-%m-%d--%H-%M-%S`
mkdir -p backup/db
${COMMAND} exec -it ${CONTAINER} mariadb-dump --databases ${DB} --add-drop-database --routines --triggers --user=root > backup/db/${DB}-${DATE}.sql
