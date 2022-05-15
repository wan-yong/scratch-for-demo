#!/usr/bin/env bash
#
# SPDX-License-Identifier: Apache-2.0
#
set -euo pipefail
: ${JVM_TUNE_ENABLED:="false"}
: ${DEBUG:="false"}

if [ "${DEBUG,,}" = "true" ]; then
   exec java -agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=0.0.0.0:8000 -jar /demo.jar
elif [ "${JVM_TUNE_ENABLED,,}" = "true" ]; then
   exec java -Xms 256M -Xmm 256M -jar /demo.jar # todo
else
   exec java -jar /demo.jar
fi

