#!/bin/bash

# Set TinyPilot to jiggle the mouse every 3 seconds.

# Author: Michael Lynch
# https://tinypilotkvm.com
# License: MIT License
script_name=`basename $0`

if [ -f /tmp/tinypilot-jiggler_pid ]; then
    echo "Trying to stop previous instance of process '$script_name'"
    kill $(cat /tmp/tinypilot-jiggler_pid) || true
    echo "Removing '$script_name' pid file"
    rm /tmp/tinypilot-jiggler_pid
fi

echo "Starting a new '$script_name' instance"
echo "PID of '$script_name' script: $$"
echo "PPID of '$script_name' script: $PPID"
echo "Writing '$script_name' pid to file"
echo $$ > /tmp/tinypilot-jiggler_pid

set -e
set -u

# Change the value below to any you want
readonly TIME_BETWEEN_JIGGLES="599s"
i=0

while true
do
  echo "$(date --iso-8601=seconds):" "Moving mouse cursor"
  if (( $i % 2 )); then
    echo -ne "\0\x03\x16\x58\x4c\0\0" > /dev/hidg1
  else
    echo -ne "\0\xbc\x1b\xdd\x2a\0\0" > /dev/hidg1
  fi
  i=$((i+1))
  echo "$(date --iso-8601=seconds):" "Completed movement. Sleeping for ${TIME_BETWEEN_JIGGLES}"
  sleep "${TIME_BETWEEN_JIGGLES}"
done

