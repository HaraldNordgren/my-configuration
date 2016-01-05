#!/bin/bash


# Reset terminal
echo -ne '\0033\0143'

start=$PWD

for d in */; do
    cd $d

    if [ -n "$(git status --porcelain)" ]; then
        echo $d
        echo
        git -c color.status=always status | sed 's/^/  /'
        echo
    fi


    if [ -n "$(git submodule)" ]; then
        git submodule --quiet foreach \
        'if [ -n "$(git status --porcelain)" ]; then \
            echo "$name (in $(basename $toplevel))"; \
            git -c color.status=always status | \
            fold -w 70 -s | sed "s/^/  /"; \
            echo; \
        fi' | sed 's/^/  /'
    fi

    cd $start
done
