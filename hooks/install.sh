#!/bin/bash

# Adapted from https://gist.github.com/tilap/0590e78c9cfd8f6548f5

# Basic script to set custom project hook and share it with other developpers
#
# cd [path-of-the-script]
# . install.sh
#
# Folders usecase
# /.git
# /.git/hooks
# /hooks/install.sh <- this script
# /hooks <- path of your hooks

set -e

# list of hooks the script will look for
HOOK_NAMES="applypatch-msg pre-applypatch post-applypatch pre-commit prepare-commit-msg commit-msg post-commit pre-rebase post-checkout post-merge pre-receive update post-receive post-update pre-auto-gc"

PROJECT_ROOT_DIR=`git rev-parse --show-toplevel`

# absolute folder path of directory into which hooks should be installed
TGT_DIR=$PROJECT_ROOT_DIR/.git/hooks

# absolute folder path of the custom hooks to deploy / current script
SRC_DIR=$PROJECT_ROOT_DIR/hooks

# relative folder path from the target dir to the source dir
LNS_RELATIVE_PATH=../../hooks

echo "Install project git hooks"

for hook in $HOOK_NAMES; do
    # if we have a custom hook to set
    if [ -f $SRC_DIR/$hook ]; then
      echo "> Hook $hook"
      if [ ! -x $SRC_DIR/$hook ]; then
          echo " > Not executable, skipping"
          continue
      fi
      # If the hook already exists, is executable, and is not a symlink
      if [ ! -h $TGT_DIR/$hook -a -x $TGT_DIR/$hook ]; then
          echo " > Old git hook $hook disabled"
          # append .old to disable it
          mv $TGT_DIR/$hook $TGT_DIR/$hook.old
      fi

      # create the symlink, overwriting the file if it exists
      echo " > Enable project git hook"
      ln -s -f $LNS_RELATIVE_PATH/$hook $TGT_DIR/$hook
    fi
done
