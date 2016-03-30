#!/bin/sh

git filter-branch --env-filter '

if [ "$GIT_COMMITTER_NAME" = "haraldnordgren" ]
then
    export GIT_COMMITTER_NAME="Harald Nordgren"
fi
if [ "$GIT_AUTHOR_NAME" = "haraldnordgren" ]
then
    export GIT_AUTHOR_NAME="Harald Nordgren"
fi
' --tag-name-filter cat -- --branches --tags
