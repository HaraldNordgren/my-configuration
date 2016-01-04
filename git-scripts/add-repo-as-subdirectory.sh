#!/bin/bash

repo=$1
path=$2

git remote add -f $repo $path/
git merge -s ours --no-commit $repo/master
git read-tree --prefix=$repo/ -u $repo/master
git commit -m "merging $repo into repo"
