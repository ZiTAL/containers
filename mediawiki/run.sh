#!/bin/bash
source env.sh
${COMMAND} run --rm -it -v mediawiki-volume-${MEDIAWIKI_VF}:/app mediawiki_php /bin/sh
