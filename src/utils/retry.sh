#!/bin/bash

NEXT_WAIT_TIME=0
until "$@" ; EXIT_STATUS="$?" ; [[ "${EXIT_STATUS}" -eq 0 || "${NEXT_WAIT_TIME}" -eq 3 ]]; do
  sleep "$(( NEXT_WAIT_TIME++ ))"
done
exit "${EXIT_STATUS}"
