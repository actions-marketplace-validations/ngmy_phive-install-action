#!/bin/bash

git clone "${GITHUB_SERVER_URL}/${GITHUB_REPOSITORY}.git" .
git fetch
git checkout "${GITHUB_SHA}"
