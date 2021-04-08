#!/bin/bash

yes | \
php phive.phar --no-progress install \
  --copy \
  $*
