#!/bin/bash

if [ -z "$(unix2dos < $1 | cmp - $1)" ]; then
    echo "Dos endings"
elif [ -z "$(dos2unix < $1 | cmp - $1)" ]; then
    echo "Unix endings"
else
    echo "Mixed endings!"
fi
