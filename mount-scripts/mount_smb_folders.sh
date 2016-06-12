#!/bin/bash

function m {
    mount -t cifs -o credentials=~/.smbcredentials //10.0.0.39/$1 $2
}

m "dest-folder" "local-folder"
