#!/bin/bash
#Run your pre-commit check from here for date changes

# ./urlcheck-run.sh
git stash -q --keep-index
./urlcheck-run.sh
RESULT=$?
git stash pop -q
[ $RESULT -ne 0 ] && exit 1
exit 0
