#!/bin/bash

yes | \
./phive.phar --no-progress install \
  --copy \
  $*
