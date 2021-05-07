#!/bin/bash

set -Ceuo pipefail

yes | \
./phive.phar --no-progress install \
  --copy \
  $*
