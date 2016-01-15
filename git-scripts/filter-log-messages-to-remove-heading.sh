#!/bin/bash

if [ $# != 1 ]; then
    echo "Usage: <header-text>"
    exit 1
fi

git filter-branch -f --msg-filter "sed 's/^$1: \(.*\)/\1/'" HEAD
