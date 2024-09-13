#!/bin/bash
source version.sh
podman run --rm -it -v mediawiki-volume-${MEDIAWIKI_VF}:/app mediawiki_data /bin/sh
