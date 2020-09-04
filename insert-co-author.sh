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

git show $all_commit_hash --pretty=format:"Co-authored-by: %cn <%ae>" --quiet  | sort -u >> $commit_message_file
