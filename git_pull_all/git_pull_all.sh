#!/bin/bash
# Add $GIT_REPOSITORIES_PATH to your environment for example by adding the following line to your .profile
# export GIT_REPOSITORIES_PATH="\home\<user>\<repositories_folder>
echo "pulling all git repositories in ${GIT_REPOSITORIES_PATH}"
cd $GIT_REPOSITORIES_PATH
find . -mindepth 1 -maxdepth 1 -type d -print -exec git -C {} pull \;