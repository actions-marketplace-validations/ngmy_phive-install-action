#!/bin/bash

next_wait_time=0
until "$@" ; exit_status="$?" ; [[ "${exit_status}" -eq 0 || "${next_wait_time}" -eq 3 ]]; do
  sleep "$(( next_wait_time++ ))"
done
exit "${exit_status}"
