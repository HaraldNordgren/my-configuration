#!/bin/bash

# Declare hash table
declare -A Ids

# Go though first input file and add key-value pairs to hash table
while read Id; do
    key=$(echo $Id | cut -d " " -f1)
    value=$(echo $Id | cut -d " " -f2)
    Ids+=([$key]=$value)
done < $1

# Go through second input file and replace every first column with
# the corresponding value in the hash table if it exists
while read line; do
    first_col=$(echo $line | cut -d '"' -f2)
    new_id=${Ids[$first_col]}

    if [ -n "$new_id" ]; then
        sed -i s/$first_col/$new_id/g $2
    fi
done < $2
