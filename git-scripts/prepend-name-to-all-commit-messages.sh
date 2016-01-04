#!/bin/bash

dir=$(basename $PWD)
git filter-branch --msg-filter "sed '1 s/^/$dir: /'" HEAD
