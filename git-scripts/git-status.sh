#!/bin/bash

# Reset terminal
echo -ne '\0033\0143'

start=$PWD

for d in */; do
    cd "$d"

    git status &>/dev/null

    if [ $? == 128 ]; then
        not_repos+="$d "
        cd $start
        continue
    fi

    if [[ -n "$(git status --porcelain)" || \
        -n "$(git rev-list origin/master..master)" ]]; then

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

for d in $not_repos; do
    echo -e "$d is not a git repo"
done
