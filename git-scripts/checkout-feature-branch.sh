#!/bin/bash

version_branch=$(echo "$1" | cut -d'_' -f 1)

set -e

git checkout $version_branch
git checkout -b $1
git branch --set-upstream-to=origin/$version_branch
