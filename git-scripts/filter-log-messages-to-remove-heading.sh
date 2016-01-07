#!/bin/bash

git filter-branch -f --msg-filter "sed 's/^chrome-extensions: \(.*\)/\1/'" HEAD
