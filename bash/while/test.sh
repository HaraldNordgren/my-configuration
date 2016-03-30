#!/bin/bash

list="abc efdfd ffd"

while read f
do
    echo $f
done < <(echo $list | xargs)
