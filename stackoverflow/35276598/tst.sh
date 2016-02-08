    #!/bin/bash

    latest_collection=0

    regex="Collection:[ ]*([0-9]+)"

    for log in sapemea_postatus.log.*; do

        [[ $(cat $log) =~ $regex ]]
        collection="${BASH_REMATCH[1]}"

        if [[ $collection > $latest_collection ]]; then
            latest_collection=$collection
            latest_log=$log
        fi
    done

    echo "Latest log is $latest_log"
    echo "(with number $latest_collection)"
