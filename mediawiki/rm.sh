#!/bin/bash
source version.sh
podman image rm localhost/mediawiki_data
podman volume rm mediawiki-volume-${MEDIAWIKI_VF}
