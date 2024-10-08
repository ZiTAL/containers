#!/bin/bash
source env.sh
CONTAINER="${NAME}_mariadb_1"
DB=$NAME
DATE=`date +%Y-%m-%d--%H-%M-%S`
${COMMAND} exec -it ${CONTAINER} mariadb-dump --databases ${DB} --add-drop-database --routines --triggers --user=root > ${DB}-${DATE}.sql
