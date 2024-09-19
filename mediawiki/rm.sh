#!/bin/bash
source env.sh
${COMMAND} volume rm -af
${COMMAND} image rm -af
