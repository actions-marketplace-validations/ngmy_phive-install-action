#!/bin/bash

set -Ceuo pipefail

set +o pipefail
yes | ./phive.phar --no-progress install --copy $*
set -o pipefail
