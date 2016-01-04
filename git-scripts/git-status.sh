#!/bin/bash

# Reset terminal
echo -ne '\0033\0143'

start=$PWD

for d in */; do
    cd $d

    if [ -n "$(git status --porcelain)" ]; then
        echo $d:
        echo
        git -c color.status=always status | sed 's/^/  /'
        echo

        if [ -n "$(git submodule)" ]; then
            echo "  Submodules: "
            echo
            git submodule foreach git -c color.status=always status | \
                sed 's/^/    /'
            echo
        fi
    fi

    cd $start
done
