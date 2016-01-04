#!/bin/bash

# Source: http://gbayer.com/development/moving-files-from-one-git-repository-to-another-preserving-history/

url=$1
clone_dest=$2
extract_dir=$3

git clone $url $clone_dest
cd $clone_dest

git remote rm origin
git filter-branch --subdirectory-filter $extract_dir/ -- --all
