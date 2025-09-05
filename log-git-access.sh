#!/bin/bash

LOGFILE=/home/user/git-activity.log

{
    echo "===================================="
    echo "Date      : $(date)"
    echo "User      : $KEY_ID"
    echo "IP        : $SSH_CONNECTION"

    # Detect action
    if [[ "$SSH_ORIGINAL_COMMAND" == git-receive-pack* ]]; then
        echo "Action    : PUSH"
    elif [[ "$SSH_ORIGINAL_COMMAND" == git-upload-pack* ]]; then
        echo "Action    : CLONE/PULL"
    else
        echo "Action    : $SSH_ORIGINAL_COMMAND"
    fi
} >> $LOGFILE

# Run the git command
exec git-shell -c "$SSH_ORIGINAL_COMMAND"
  
using this script automatically (git-access-log) file and (git-activity.log) file will be craeted , which is used to see which user pushed and cloned
