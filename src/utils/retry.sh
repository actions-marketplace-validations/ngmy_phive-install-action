#!/bin/bash

NEXT_WAIT_TIME=0
until "$@" || [ $NEXT_WAIT_TIME -eq 3 ]; do
  sleep $(( NEXT_WAIT_TIME++ ))
done
