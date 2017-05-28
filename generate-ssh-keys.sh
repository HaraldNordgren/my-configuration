#!/usr/bin/env bash

ssh-keygen -t rsa -b 4096 -C "haraldnordgren@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

