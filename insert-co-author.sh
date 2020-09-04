#!/usr/bin/env bash

set -euo pipefail

status=$(git status)

# If it's not a rebase, this script don't anything about it.
if [ ! "`echo $status | grep 'interactive rebase in progress;'`" ] ; then
    exit 0
fi

rebase_targets=.git/rebase-merge/done
commit_hashes=(`grep -E "squash\s+" $rebase_targets | awk '{print $2}'`)

all_commit_hash=${commit_hashes[@]}
commit_message_file=.git/COMMIT_EDITMSG

git log --pretty=format:"Co-authored-by: %cn <%ae>" $all_commit_hash  | sort -u >> $commit_message_file
