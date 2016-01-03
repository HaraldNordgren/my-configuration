#!/bin/bash

# Reset terminal
echo -ne '\0033\0143'

start=$PWD

for d in */; do
    cd $d

    if [ -n "$(git status --porcelain)" ]; then
        echo $d:
        git -c color.status=always status | sed 's/^/  /'
        echo
    fi

    cd $start
done
