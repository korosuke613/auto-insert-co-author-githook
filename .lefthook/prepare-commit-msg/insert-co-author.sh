#!/usr/bin/env bash

set -euo pipefail

status=$(git status)

if [ ! "`echo $status | grep 'interactive rebase in progress;'`" ] ; then
    exit 0
fi

COMMIT_MSG_FILE=.git/COMMIT_EDITMSG

commit_hashes=(`grep -E "squash\s+" .git/rebase-merge/done | awk '{print $2}'`)

HASH=${commit_hashes[@]}

git log --pretty=format:"Co-authored-by: %cn <%ae>" $HASH  | uniq >> $COMMIT_MSG_FILE

