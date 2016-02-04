#!/bin/bash

if [ -z "$2" ]
then
    echo "usage: $0 <repo-url> <folder>"
    exit 1
fi

git init
git remote add -f origin $1

git config core.sparseCheckout true
echo $2 >> .git/info/sparse-checkout

git pull origin master
